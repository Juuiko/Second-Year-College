library ieee;
use ieee.std_logic_1164.all;

entity program_counter is
	port(
		add : in std_logic_vector(15 downto 0);
		PI : in std_logic;
		PL : in std_logic;
		clk : in std_logic;
		reset : in std_logic;
        PC_out : out std_logic_vector(15 downto 0));	
end program_counter;

architecture behavioral of program_counter is

	
	component adder16 port( 
		A : in std_logic_vector (15 downto 0);
		B : in std_logic_vector (15 downto 0);
		c_in : in std_logic;
		c_out : out std_logic;
		G : out std_logic_vector (15 downto 0);
		V : out std_logic);
	end component;

	component reg16 port(
		D : in std_logic_vector (15 downto 0);
		load : in std_logic;
		clk : in std_logic;
		Q : out std_logic_vector (15 downto 0));
	end component;

	signal add_out : std_logic_vector(15 downto 0);
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
		G => add_out);


	register_in <= "0000000000000000" after delay when reset = '1'
	else add_out after delay when PI='1'
	else add after delay when PL ='1';

	PC_out <= reg_out;

end behavioral;
