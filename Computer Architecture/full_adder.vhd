library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port ( 
		A : in std_logic;
        B : in std_logic;
        c_in : in std_logic;
        S : out std_logic;
        c_out : out std_logic);
end full_adder;

architecture behavioral of full_adder is

signal s1 : std_logic;
signal s2 : std_logic;
signal s3 : std_logic;

begin

	s1 <= (A xor B) after 1 ns;
	s2 <= (c_in and s1) after 1 ns;
	s3 <= (A and B) after 1 ns;
	S <= (s1 xor c_in) after 1 ns;
	c_out <= (s2 or s3) after 1 ns;

end behavioral;