library ieee;
use ieee.std_logic_1164.all;


entity lc_slice is
    port ( 
		s0 : in std_logic;
        s1 : in std_logic;
        A : in std_logic;
        B : in std_logic;
        G : out std_logic);
end lc_slice;

architecture behavioral of lc_slice is

	component mux4_1bit port(
           s0 : in std_logic;
           s1 : in std_logic;
           in0 : in std_logic;
           in1 : in std_logic;
           in2 : in std_logic;
           in3 : in std_logic;
           out0 : out std_logic);
	end component;

signal A_and_B : std_logic;
signal A_or_B : std_logic;
signal A_xor_B : std_logic;
signal not_A : std_logic;

begin

	A_and_B <= A and B;
	A_or_B <= A or B;
	A_xor_B <= A xor B;
	not_A <= not A;

	mux4_1: mux4_1 port map(
		s0 => s0,
		s1 => s1,
		in0 => A_and_B,
		in1 => A_or_B,
		in2 => A_xor_B,
		in3 => not_A,
		out0 => Gi
	);

end behavioral;