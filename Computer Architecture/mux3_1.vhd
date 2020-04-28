library ieee;
use ieee.std_logic_1164.all;

entity mux3_1 is
    port (
        in0 : in std_logic;
        in1 : in std_logic;
        in2 : in std_logic;
        S : in std_logic_vector(1 downto 0); 
        Q : out std_logic);
end mux3_1;

architecture behavioral of mux3_1 is

    constant delay: Time := 1 ns;

    begin
        Q <= in0 after delay when S="00" else
             in1 after delay when S="01" else
             in2 after delay when S="10"else
             '0' after delay;
end behavioral;