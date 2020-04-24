library ieee;
use ieee.std_logic_1164.all;

entity arithmetic is
	port(
			c_in : in std_logic;
        	A : in std_logic_vector (15 downto 0);
        	B : in std_logic_vector (15 downto 0);
        	s0 : in std_logic;
        	s1 : in std_logic;
        	G : out std_logic_vector (15 downto 0);
        	c_out : out std_logic;
        	V : out std_logic);
end arithmetic;

architecture behavioral of arithmetic is

	component b_input_logic 
		port(
          s0 : in std_logic;
		  s1 : in std_logic;
		  B : in std_logic_vector (15 downto 0);
          Y : out std_logic_vector (15 downto 0));
	end component;

	component adder16 
		port( 
           A : in std_logic_vector (15 downto 0);
           B : in std_logic_vector (15 downto 0);
		   c_in : in std_logic;
		   c_out : out std_logic;
           G : out std_logic_vector (15 downto 0);
           V : out std_logic);
	end component;

	signal Y : std_logic_vector (15 downto 0);

begin

	b_logic: b_input_logic port map(
		B => B,
		s0 => s0,
		s1 => s1,
		Y => Y
	);
	   
	adder: adder16 port map(
		A => A,
		B => Y,
		c_in => c_in,
		G => G, 
		c_out => c_out,
		V => V
	);

end behavioral;
