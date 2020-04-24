library ieee;
use ieee.std_logic_1164.all;

entity zero_fill is
	port(
		I : in std_logic_vector(2 downto 0);
        O : out std_logic_vector(15 downto 0));
end zero_fill;

architecture behavioral of zero_fill is

	constant delay: Time := 1 ns;

begin
	O(0) <= I(0) after delay;
	O(1) <= I(1) after delay;
	O(2) <= I(2) after delay;
	O(15 downto 3) <= "0000000000000" after delay;
end behavioral;
