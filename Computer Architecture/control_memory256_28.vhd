library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity control_memory256_28 is
	port(
		in_car : in std_logic_vector (7 downto 0);
		MW : out std_logic;
		MM : out std_logic;
		RW : out std_logic;
		MD : out std_logic;
		FS : out std_logic_vector(4 downto 0);
		MB : out std_logic;
		TB : out std_logic;
		TA : out std_logic;
		TD : out std_logic;
		PL : out std_logic;
		PI : out std_logic;
		IL : out std_logic;
		MC : out std_logic;
		MS : out std_logic_vector(2 downto 0);
		NA : out std_logic_vector(7 downto 0));
end control_memory256_28;

architecture behavioral of control_memory256_28 is

	type mem_array is array(0 to 255) of std_logic_vector(27 downto 0);
	begin
		memory_m: process(in_car)
			variable control_mem : mem_array:=(
				"1111111100010101010111110101", --0
				"0000000011101010101000001010", --1
				"1111111100010101010111110101", --2
				"0000000011101010101000001010", --3
				"1111111100010101010111110101", --4
				"0000000011101010101000001010", --5
				"1111111100010101010111110101", --6
				X"0000000", --7
				X"0000000", --8
                X"0000000", --9
                X"0000000", --A
				X"0000000", --B
				X"0000000", --C
				X"0000000", --D
				X"0000000", --E
				X"0000000", --F
			
				X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", --0
				X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", --1
				X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", --2
				X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", --3
				X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", --4
				X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", --5
				X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", --6
				X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", --7
				X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", --8
				X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", --9
				X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", --A
				X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", --B
				X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", --C
				X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", --D
				X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000", X"0000000"  --E
			);

	variable addr : integer;
	variable ctrl_out : STD_LOGIC_VECTOR(27 downto 0);

begin

	addr := to_integer(unsigned(in_car));
	ctrl_out := control_mem(addr);

	MW <= ctrl_out(0);
	MM <= ctrl_out(1);
	RW <= ctrl_out(2);
	MD <= ctrl_out(3);
	FS <= ctrl_out(8 downto 4);
	MB <= ctrl_out(9);
	TB <= ctrl_out(10);
	TA <= ctrl_out(11);
	TD <= ctrl_out(12);
	PL <= ctrl_out(13);
	PI <= ctrl_out(14);
	IL <= ctrl_out(15);
	MC <= ctrl_out(16);
	MS <= ctrl_out(19 downto 17);
	NA <= ctrl_out(27 downto 20);
	end process;

end behavioral;