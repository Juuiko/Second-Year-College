library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux4_4bit is
	Port (
		in0 : in std_logic_vector(3 downto 0);
		in1 : in std_logic_vector(3 downto 0);
		in2 : in std_logic_vector(3 downto 0);
		in3 : in std_logic_vector(3 downto 0);
		s0 : in std_logic
		s1 : in std_logic
		Z : out std_logic_vector(3 downto 0));
end mux4_4bit;

architecture Behavioral of mux4_4bit is
begin

    z <= in0 when (s0='0') && (s1='0') else
         in1 when (s0='1') && (s1='0')  else
         in2 when (s0='0') && (s1='1')  else
         in3 when (s0='1') && (s1='1')  else
         "0000" after 5 ns;

end Behavioral;
