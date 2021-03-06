library ieee;
use ieee.std_logic_1164.all;

entity mux8_16 is
	port(
		in0 : in std_logic_vector(15 downto 0);
		in1 : in std_logic_vector(15 downto 0);
		in2 : in std_logic_vector(15 downto 0);
		in3 : in std_logic_vector(15 downto 0);
		in4 : in std_logic_vector(15 downto 0);
		in5 : in std_logic_vector(15 downto 0);
		in6 : in std_logic_vector(15 downto 0);
		in7 : in std_logic_vector(15 downto 0);
		S : in std_logic_vector(2 downto 0);
		Z : out std_logic_vector(15 downto 0));
end mux8_16;

architecture behavioral of mux8_16 is

	constant delay: Time := 1 ns;

begin
    Z <= in0 after delay when (S="000") else
         in1 after delay when (S="001") else
         in2 after delay when (S="010") else
         in3 after delay when (S="011") else
         in4 after delay when (S="100") else
         in5 after delay when (S="101") else
         in6 after delay when (S="110") else
         in7 after delay when (S="111");
end behavioral;
