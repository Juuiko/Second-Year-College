--2-to-4 Line Decoder: Structural VHDL Description
library ieee, lcdf_vhdl;
use ieee.std_logic_1164.all, lcdf_vhdl.func_prims.all;
entity mux_2to4 is
	port(
		s : in std_logic;
		ln0 : in std_logic_vector(3 downto 0);
		ln1 : in std_logic_vector(3 downto 0);
		z : out std_logic_vector(3 downto 0));
	end mux_2to4;

architecture dataflow of mux_2to4 is

begin
	
	z <= ln0 when s='0' else ln1 when s='1'

end dataflow;
