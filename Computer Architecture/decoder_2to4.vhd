--2-to-4 Line Decoder: Structural VHDL Description
library ieee, lcdf_vhdl;
use ieee.std_logic_1164.all, lcdf_vhdl.func_prims.all;
entity decoder_2_to_4 is
	port(E, A0, A1: instd_logic;
		D0, D1, D2, D3: outstd_logic);
	end decoder_2_to_4;

architecture dataflow of decoder_2_to_4 is

component NOT
	port(in1: in std_logic;
		out1: out std_logic);
end component;

component NAND
	port(in1, in2, in3: in std_logic;
		out1: out std_logic);
end component;

signal not_A0, not_A1: std_logic;

begin
	not_A0 <= notA0;
	not_A1 <= notA1;
	D0 <= not ( not_A0 and not_A1 and E);
	D1 <= not( A0 and not_A1 and E);
	D2 <= not( not_A0 and A1 and E);
	D3 <= not( A0 and A1 and E);
end dataflow;
