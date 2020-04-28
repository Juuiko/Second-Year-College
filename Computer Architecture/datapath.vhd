library ieee;
use ieee.std_logic_1164.all;

entity datapath is
	port(
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
end datapath;

architecture behavioral of datapath is

	component register_file port(
            write : in std_logic;
            clk : in std_logic;
			D_select : in std_logic_vector(2 downto 0);
			D_data : in std_logic_vector(15 downto 0);
			A_select : in std_logic_vector(2 downto 0);
			A_data : out std_logic_vector(15 downto 0);
			B_select : in std_logic_vector(2 downto 0);
            B_data : out std_logic_vector(15 downto 0));
	end component;

	component function_unit port(
		A : in std_logic_vector (15 downto 0);
        B : in std_logic_vector (15 downto 0);
        FS : in std_logic_vector (4 downto 0);
		V : out std_logic;
		C : out std_logic;
		N : out std_logic;
		Z : out std_logic;
		F : out std_logic_vector (15 downto 0));
	end component;

	component mux2_16 port(
		in0 : in STD_LOGIC_VECTOR (15 downto 0);
		in1 : in STD_LOGIC_VECTOR (15 downto 0);
		S : in STD_LOGIC;
		Z : out STD_LOGIC_VECTOR (15 downto 0));
	end component;

	signal F : STD_LOGIC_VECTOR(15 downto 0);
	signal muxB_out : STD_LOGIC_VECTOR(15 downto 0);
	signal muxD_out : STD_LOGIC_VECTOR(15 downto 0);
	signal A_data : STD_LOGIC_VECTOR(15 downto 0);
	signal B_data : STD_LOGIC_VECTOR(15 downto 0);

begin

	address_out <= A_data;
	data_out <= muxB_out;

    reg_file : register_file port map(
        write => write,
        clk => clk,
        D_data => muxD_out,
        A_select => A_address,
        B_select => B_address,
        D_select => D_address,
        A_data => A_data,
        B_data => B_data
    );

	func_unit : function_unit port map(
		A=>A_data,
		B=>muxB_out,
		FS=>FS,
		F=>F,
		V=>V,
		C=>C,
		N=>N,
		Z=>Z);

	muxB : mux2_16 port map(
		in0 => B_data,
		in1 => constant_in,
		S => MB_select,
		Z => muxB_out);

	muxD : mux2_16 port map(
		in0 => F,
		in1 => data_in,
		S => MD_select,
		Z => muxD_out);

end behavioral;