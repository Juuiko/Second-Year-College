library ieee;
use ieee.std_logic_1164.all;

entity car is
    port ( 
		in_address : in std_logic_vector (7 downto 0);
        load_address : in std_logic;
        clk : in std_logic;
        out_address : out std_logic_vector (7 downto 0));
end car;

architecture behavioral of car is

	component reg16 port(
		D : in std_logic_vector (15 downto 0);
		load : in std_logic;
		clk : in std_logic;
		Q : out std_logic_vector (15 downto 0));
	end component;

	component adder16 port( 
		A : in std_logic_vector (15 downto 0);
		B : in std_logic_vector (15 downto 0);
		c_in : in std_logic;
		c_out : out std_logic;
		S : out std_logic_vector (15 downto 0);
		V : out std_logic);
	end component;

	signal adder_out : std_logic_vector(15 downto 0);
	signal reg_in : std_logic_vector(15 downto 0);
	signal reg_out : std_logic_vector(15 downto 0);

	constant delay: Time := 1 ns;

begin

	reg : reg16 port map(
		D => reg_in,
		load => '1',
		clk => clk,
		Q => reg_out);
		
	adder : adder16 port map(
		A => reg_out,
		B => X"0001",
		c_in => '0',
		S => adder_out);
		
	reg_in <= adder_out after delay when load_address = '0'
	else "00000000" & in_address after delay when load_address ='1';

	out_address <= reg_out(7 downto 0);
end behavioral;