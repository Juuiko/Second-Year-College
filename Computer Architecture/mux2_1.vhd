library ieee;
use ieee.std_logic_1164.all;

entity mux2_1 is
	port(
		S : in std_logic;
		in0 : in std_logic;
		in1 : in std_logic;
		Z : out std_logic);
end mux2_1;

architecture behavioral of mux2_1 is

	constant delay: Time := 1 ns;

begin
	Z <=in0 after delay when s='0' else in1 after delay when s='1' else '0' after delay;
end behavioral;
