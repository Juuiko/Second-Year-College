library ieee;
use ieee.std_logic_1164.all;

entity instruction_register is
	port(
		inst_in : in std_logic_vector (15 downto 0);
		IL : in std_logic;
		clk : in std_logic;
		opcode : out std_logic_vector (6 downto 0);
		DR : out std_logic_vector (2 downto 0);
		SA : out std_logic_vector (2 downto 0);
		SB : out std_logic_vector (2 downto 0));
end instruction_register;

architecture behavioral of instruction_register is

	constant delay: Time := 1 ns;
	signal output : std_logic_vector(15 downto 0);

begin

	process(clk)
		begin
		if(rising_edge(clk)) then if IL='1' then output<=inst_in after delay;
			end if;
		end if;
	end process;

	opcode <= output(15 downto 9);
	DR <= output(8 downto 6);
	SA <= output(5 downto 3);
	SB <= output(2 downto 0);

end behavioral;
