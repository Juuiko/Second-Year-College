library ieee;
use ieee.std_logic_1164.all;

entity mux4_1 is
    port ( 
        s0 : in std_logic;
        s1 : in std_logic;
        in0 : in std_logic;
        in1 : in std_logic;
        in2 : in std_logic;
        in3 : in std_logic;
        out0 : out std_logic);
end mux4_1;

architecture behavioral of mux4_1 is

constant delay: Time := 1 ns;

begin
    out0 <= in0 after delay when s0='0' and s1='0'
    else in1 after delay when s0 ='0' and s1='1'
    else in2 after delay when s0='1' and s1='0'
    else in3 after delay when s0='1' and s1='1'
    else '0' after delay;
end behavioral;