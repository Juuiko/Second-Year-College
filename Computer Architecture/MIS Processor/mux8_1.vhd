library ieee;
use ieee.std_logic_1164.all;

entity mux8_1 is
	port(
		in0 : in std_logic;
        in1 : in std_logic;
        in2 : in std_logic;
        in3 : in std_logic;
        in4 : in std_logic;
        in5 : in std_logic;
        in6 : in std_logic;
        in7 : in std_logic;
        s0 : in std_logic;
        s1 : in std_logic;
        s2 : in std_logic;
        Z : out std_logic);
end mux8_1;

architecture behavioral of mux8_1 is

	constant delay: Time := 1 ns;

begin
	Z <= in0 after delay when s0='0' and s1='0' and s2='0'
	else in1 after delay when s0='0' and s1='0' and s2='1'
	else in2 after delay when s0='0' and s1='1' and s2='0'
	else in3 after delay when s0='0' and s1='1' and s2='1'
	else in4 after delay when s0='1' and s1='0' and s2='0'
	else in5 after delay when s0='1' and s1='0' and s2='1'
	else in6 after delay when s0='1' and s1='1' and s2='0'
	else in7 after delay when s0='1' and s1='1' and s2='1';
end behavioral;
