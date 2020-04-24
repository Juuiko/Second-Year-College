library ieee;
use ieee.std_logic_1164.all;

entity b_input_logic is
    port (
		s0 : in std_logic;
		s1 : in std_logic;
		B : in std_logic_vector (15 downto 0);
		Y : out std_logic_vector (15 downto 0));
end b_input_logic;

architecture behavioral of b_input_logic is

component mux2_1 port(
	in0 : in std_logic;
	in1 : in std_logic;
	S : in std_logic;
	Z : out std_logic);
end component;

begin

	mux0: mux2_1 port map(
 		in0 => s0,
 		in1 => s1,
 		S => B(0),
 		Z => Y(0));

	mux1: mux2_1 port map(
 		in0 => s0,
 		in1 => s1,
 		S => B(1),
 		Z => Y(1));

	mux2: mux2_1 port map(
 		in0 => s0,
 		in1 => s1,
 		S => B(2),
 		Z => Y(2));

	mux3: mux2_1 port map(
 		in0 => s0,
 		in1 => s1,
 		S => B(3),
 		Z => Y(3));

	mux4: mux2_1 port map(
 		in0 => s0,
 		in1 => s1,
 		S => B(4),
 		Z => Y(4));

	mux5: mux2_1 port map(
 		in0 => s0,
 		in1 => s1,
 		S => B(5),
 		Z => Y(5));

	mux6: mux2_1 port map(
 		in0 => s0,
 		in1 => s1,
 		S => B(6),
 		Z => Y(6));

	mux7: mux2_1 port map(
 		in0 => s0,
 		in1 => s1,
 		S => B(7),
 		Z => Y(7));

	mux8: mux2_1 port map(
 		in0 => s0,
 		in1 => s1,
 		S => B(8),
 		Z => Y(8));

	mux9: mux2_1 port map(
 		in0 => s0,
 		in1 => s1,
 		S => B(9),
 		Z => Y(9));

	mux10: mux2_1 port map(
 		in0 => s0,
 		in1 => s1,
 		S => B(10),
 		Z => Y(10));

	mux11: mux2_1 port map(
 		in0 => s0,
 		in1 => s1,
 		S => B(11),
 		Z => Y(11));

	mux12: mux2_1 port map(
 		in0 => s0,
 		in1 => s1,
 		S => B(12),
 		Z => Y(12));

	mux13: mux2_1 port map(
 		in0 => s0,
 		in1 => s1,
 		S => B(13),
 		Z => Y(13));

	mux14: mux2_1 port map(
 		in0 => s0,
 		in1 => s1,
 		S => B(14),
 		Z => Y(14));

	mux15: mux2_1 port map(
 		in0 => s0,
 		in1 => s1,
 		S => B(15),
 		Z => Y(15));

end behavioral;