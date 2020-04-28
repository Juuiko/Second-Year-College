library ieee;
use ieee.std_logic_1164.all;


entity alu16 is
    port ( 
		A : in std_logic_vector (15 downto 0);
		B : in std_logic_vector (15 downto 0);
		s0 : in std_logic;
		s1 : in std_logic;
		s2 : in std_logic;
		c_in : in std_logic;
		c_out : out std_logic;
		G : out std_logic_vector (15 downto 0);
		V : out std_logic);
end alu16;

architecture behavioral of alu16 is

	component lc16 port(
		A : in std_logic_vector (15 downto 0);
		B : in std_logic_vector (15 downto 0);
		s0 : in std_logic;
		s1 : in std_logic;
		G : out std_logic_vector (15 downto 0));
	end component;

	component arithmetic port(
		c_in : in std_logic;
		A : in std_logic_vector (15 downto 0);
		B : in std_logic_vector (15 downto 0);
		s0 : in std_logic;
		s1 : in std_logic;
		G : out std_logic_vector (15 downto 0);
		c_out : out std_logic;
		V : out std_logic);
	end component;

	component mux2_16 port(
		S : in std_logic;
		in0 : in std_logic_vector (15 downto 0);
		in1 : in std_logic_vector (15 downto 0);
		Z : out std_logic_vector (15 downto 0));
	end component;

	signal AG : std_logic_vector(15 downto 0);
	signal LG : std_logic_vector(15 downto 0);

begin
	mux: mux2_16 port map(
		in0 => AG,
		in1 => LG,
		S => s2,
		Z => G);

	arith: arithmetic port map(
		c_in => c_in,
		A => A,
		B => B,
		s0 => s0,
		s1 => s1,
		G => AG,
		c_out => c_out,
		V => V);

	lc: lc16 port map(
		A => A,
		B => B,
		s0 => s0,
		s1 => s1,
		G => LG);

end behavioral;