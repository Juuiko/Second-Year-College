library ieee;
use ieee.std_logic_1164.all;

entity zero_detector16 is
	port(
		G : in std_logic_vector (15 downto 0);
		Z : out std_logic);
end zero_detector16;

architecture behavioral of zero_detector16 is

constant delay: Time := 1 ns;

begin
	Z <= '1' after delay when G="0000000000000000" else '0' after delay;
end behavioral;
