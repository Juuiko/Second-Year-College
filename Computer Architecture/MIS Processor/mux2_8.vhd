library ieee;
use ieee.std_logic_1164.all;

entity mux2_8 is
	port(
		in0 : in std_logic_vector (7 downto 0);
        in1 : in std_logic_vector (7 downto 0);
        S : in std_logic;
        Z : out std_logic_vector (7 downto 0));
end mux2_8;

architecture behavioral of mux2_8 is

	constant delay: Time := 1 ns;

begin
	Z <=in0 after delay when s='0'
	else in1 after delay when s='1';
end behavioral;
