library ieee;
use ieee.std_logic_1164.all;

entity function_unit is
    port ( 
		A : in std_logic_vector (15 downto 0);
        B : in std_logic_vector (15 downto 0);
        FS : in std_logic_vector (4 downto 0);
		V : out std_logic;
		C : out std_logic;
		N : out std_logic;
		Z : out std_logic;
		F : out std_logic_vector (15 downto 0));
end function_unit;

architecture behavioral of function_unit is

	component alu16 port(
		A : in std_logic_vector (15 downto 0);
		B : in std_logic_vector (15 downto 0);
		s0 : in std_logic;
		s1 : in std_logic;
		s2 : in std_logic;
		c_in : in std_logic;
		c_out : out std_logic;
		G : out std_logic_vector (15 downto 0);
		V : out std_logic);
	end component;

	component shifter port(
		S : in std_logic_vector(1 downto 0);
        B : in std_logic_vector(15 downto 0);
        H : out std_logic_vector(15 downto 0));
	end component;

	component zero_detector16 port(
		G : in std_logic_vector (15 downto 0);
		Z : out std_logic);
	end component;

	component mux2_16 port(
		S : in std_logic;
		in0 : in std_logic_vector(15 downto 0);
		in1 : in std_logic_vector(15 downto 0);
		Z : out std_logic_vector(15 downto 0));
	end component;

	signal alu_out : std_logic_vector (15 downto 0);
	signal shifter_out : std_logic_vector (15 downto 0);

begin

	alu : alu16 port map(
		A=>A,
		B=>B,
		s0=>FS(1),
		s1=>FS(2),
		s2=>FS(3),
		c_in=>FS(0),
		c_out=>C,
		G=>alu_out,
		V => V);

	shift : shifter port map(
		B=>B,
		S(0)=>FS(1),
		S(1)=>FS(2),
		H=>shifter_out);

	muxF : mux2_16 port map(
		in0=>alu_out,
		in1=>shifter_out,
		S=>FS(4),
		Z=>F);

	zero_detect : zero_detector16 port map(
		G => alu_out,
		Z => Z);
    
	N<=alu_out(15);
	
end behavioral;