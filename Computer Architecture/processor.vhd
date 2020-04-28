library ieee;
use ieee.std_logic_1164.all;

entity processor is
	port(
		reset : in std_logic;
		clk : in std_logic;
		inst_in : in std_logic_vector(15 downto 0);
		data_in : in std_logic_vector (15 downto 0);
		data_out : out std_logic_vector (15 downto 0);
		addr_out : out std_logic_vector (15 downto 0));
end processor;

architecture behavioral of processor is

	component datapath port(
		constant_in : in std_logic_vector (15 downto 0);
        MB_select : in std_logic;
        MD_select : in std_logic;
        data_in : in std_logic_vector (15 downto 0);
        clk : in std_logic;
        write : in std_logic;
        D_address : in std_logic_vector(2 downto 0);
        A_address : in std_logic_vector(2 downto 0);
        B_address : in std_logic_vector(2 downto 0);
        FS : in std_logic_vector(4 downto 0);
        address_out : out std_logic_vector (15 downto 0);
        data_out : out std_logic_vector (15 downto 0);
        V : out std_logic;
        C : out std_logic;
        N : out std_logic;
        Z : out std_logic);
	end component;

	component mux2_16 port(
		S : in std_logic;
		in0 : in std_logic_vector(15 downto 0);
		in1 : in std_logic_vector(15 downto 0);
		Z : out std_logic_vector(15 downto 0));
	end component;

	
	component zero_fill port(
		I : in std_logic_vector(2 downto 0);
        O : out std_logic_vector(15 downto 0));
	end component;

	component sign_extended port ( 
		I : in std_logic_vector(5 downto 0);
		O : out std_logic_vector(15 downto 0));
	end component;

	component program_counter port(
		add : in std_logic_vector(15 downto 0);
		PI : in std_logic;
		PL : in std_logic;
		clk : in std_logic;
		reset : in std_logic;
        PC_out : out std_logic_vector(15 downto 0));
	end component;

	component mux8_1 port(
		in0 : in std_logic;
        in1 : in std_logic;
        in2 : in std_logic;
        in3 : in std_logic;
        in4 : in std_logic;
        in5 : in std_logic;
        in6 : in std_logic;
        in7 : in std_logic;
        s0 : in std_logic;
        s1 : in std_logic;
        s2 : in std_logic;
        Z : out std_logic);
	end component;
	
	component memory port(
		data_in : in std_logic_vector (15 downto 0);
		address : in std_logic_vector (15 downto 0);
		MW : in std_logic;
		data_out : out std_logic_vector (15 downto 0));
	end component;

	component instruction_register port(
		inst_in : in std_logic_vector (15 downto 0);
		IL : in std_logic;
		clk : in std_logic;
		opcode : out std_logic_vector (6 downto 0);
		DR : out std_logic_vector (2 downto 0);
		SA : out std_logic_vector (2 downto 0);
		SB : out std_logic_vector (2 downto 0));
	end component;

	component mux2_8 port(
		in0 : in std_logic_vector (7 downto 0);
        in1 : in std_logic_vector (7 downto 0);
        S : in std_logic;
        Z : out std_logic_vector (7 downto 0));
	end component;
	
	component car port(
		in_address : in std_logic_vector (7 downto 0);
        load_address : in std_logic;
        clk : in std_logic;
        out_address : out std_logic_vector (7 downto 0));
	end component;

	component control_memory256_28 Port(
		in_car : in std_logic_vector (7 downto 0);
		MW : out std_logic;
		MM : out std_logic;
		RW : out std_logic;
		MD : out std_logic;
		FS : out std_logic_vector(4 downto 0);
		MB : out std_logic;
		TB : out std_logic;
		TA : out std_logic;
		TD : out std_logic;
		PL : out std_logic;
		PI : out std_logic;
		IL : out std_logic;
		MC : out std_logic;
		MS : out std_logic_vector(2 downto 0);
		NA : out std_logic_vector(7 downto 0));
	end component;

	signal MM : std_logic;
    signal MW : std_logic;
	signal RW : std_logic;
	signal MD : std_logic;
	signal FS : std_logic_vector(4 downto 0);
	signal MB : std_logic;
	signal TB : std_logic;
	signal TA : std_logic;
	signal TD : std_logic;
	signal PL : std_logic;
	signal PI : std_logic;
	signal IL : std_logic;
	signal MC : std_logic;
	signal MS : std_logic_vector (2 downto 0);
	signal NA : std_logic_vector(7 downto 0);

	signal CAR_out : std_logic_vector(7 downto 0);
	signal muxc_out : std_logic_vector(7 downto 0);
	signal opcode : std_logic_vector(6 downto 0);
	signal DR : std_logic_vector(2 downto 0);
	signal SA : std_logic_vector(2 downto 0);
	signal SB : std_logic_vector(2 downto 0);
	signal muxs_out : std_logic;
	signal muxm_out : std_logic_vector(15 downto 0);
	signal zero_fill_out : std_logic_vector(15 downto 0);
	signal sign_extend_out : std_logic_vector(15 downto 0);
	signal pc_out : std_logic_vector(15 downto 0);
	signal datapath_address_out : std_logic_vector(15 downto 0);
	signal mem_addr : std_logic_vector(15 downto 0);
	signal data_in_out : std_logic_vector(15 downto 0);

	signal V : std_logic;
	signal C : std_logic;
	signal N : std_logic;
	signal Z : std_logic;
	signal notC : std_logic;
	signal notZ : std_logic;	

begin
	
	control_mem : control_memory256_28 port map(
		IN_CAR => CAR_out,
		MW => MW,
		MM => MM,
		RW => RW,
		MD => MD,
		FS => FS,
		MB => MB,
		TB => TB, 
		TA => TA,
		TD => TD,
		PL => PL,
		PI => PI,
		IL => IL,
		MC => MC,
		MS => MS,
		NA => NA);

	ctrl_addr_reg : car port map(
		in_address => muxc_out,
		load_address => muxs_out,
		clk => clk,
		out_address => CAR_out);

	muxC : mux2_8 port map(
		in0 => NA,
		in1(7) => '0',
		in1(6 downto 0) => opcode,
		s => mc,
		Z => muxc_out);

	IR : instruction_register port map(
		inst_in => inst_in,
		IL => IL,
		clk => clk,
		opcode => opcode,
		DR => DR,
		SA => SA,
		SB => SB);

	notC <= not C;
	notZ <= not Z;
    data_in_out <= inst_in;
	mem : memory port map(
		data_in => data_in_out,
		address => mem_addr,
		MW => MW,
		data_out => data_in_out);

	muxS : mux8_1 port map(
		in0 => '0',
		in1 => '1',
		in2 => C,
		in3 => V,
		in4 => Z,
		in5 => N,
		in6 => notC,
		in7 => notZ,
		s0 => MS(0),
		s1 => MS (1),
		s2 => MS (2),
		Z => muxS_out);

	zf : zero_fill port map(
		I => SB,
		O => zero_fill_out);

	pc : program_counter port map(
		add => sign_extend_out,
		PL => PL,
		PI => PI,
		clk => clk,
		reset => reset,
		PC_out => pc_out);

	sg : sign_extended port map(
		I(5 downto 3) => DR,
		I(2 downto 0) => SB,
		O => sign_extend_out);

	dp : datapath port map(
		constant_in =>zero_fill_out,
		MB_select => MB,
		MD_select => MD,
		data_in => inst_in,
		clk => clk,
		write => RW,
		D_address(2 downto 0) => DR,
		A_address(2 downto 0) => SA,
		B_address(2 downto 0) => SB,
		FS => FS,
		address_out => datapath_address_out,
		data_out => data_out,
		V => V,
		C => C,
		N => N,
		Z => Z);

	muxM : mux2_16 port map(
		in0 => datapath_address_out,
		in1 => pc_out,
		s => MM,
		Z => mem_addr);

end behavioral;
