library ieee;
use ieee.std_logic_1164.all;

entity mux2_16 is
	port(
		S : in std_logic;
		in0 : in std_logic_vector(15 downto 0);
		in1 : in std_logic_vector(15 downto 0);
		Z : out std_logic_vector(15 downto 0));
end mux2_16;

architecture behavioral of mux2_16 is

begin
	Z <= in0 when S='0' else in1 when S='1';
end behavioral;
