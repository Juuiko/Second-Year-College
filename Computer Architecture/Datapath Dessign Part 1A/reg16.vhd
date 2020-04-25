library ieee;
use ieee.std_logic_1164.all;

entity reg16 is
	port(
		D : in std_logic_vector(15 downto 0);
		load : in std_logic;
		clk : in std_logic;
		Q : out std_logic_vector(15 downto 0));
end reg16;

architecture behavioral of reg16 is

begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if load='1' then
				Q<=D after 5 ns;
			end if;
		end if;
	end process;
end behavioral;
