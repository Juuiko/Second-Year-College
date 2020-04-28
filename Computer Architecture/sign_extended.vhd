library ieee;
use ieee.std_logic_1164.all;

entity sign_extended is
	port(
		I : in std_logic_vector(5 downto 0);
		O : out std_logic_vector(15 downto 0));
end sign_extended;

architecture behavioral of sign_extended is

	constant delay: Time := 1 ns;

begin
	O(5 downto 0) <= I after delay;
	O(15 downto 6) <= "0000000000" after delay when I(5) = '0'
	else "1111111111" after delay when I(5) = '1';
end behavioral;
