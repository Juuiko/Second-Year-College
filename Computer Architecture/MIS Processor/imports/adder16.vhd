library ieee;
use ieee.std_logic_1164.all;


entity adder16 is
    port ( 
		A : in std_logic_vector (15 downto 0);
		B : in std_logic_vector (15 downto 0);
		c_in : in std_logic;
		c_out : out std_logic;
		G : out std_logic_vector (15 downto 0);
		V : out std_logic);
end adder16;

component adder port(
          A : in std_logic;
          B : in std_logic;
          c_in : in std_logic;
          S : out std_logic;
          c_out : out std_logic);
end component;

signal c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15 : std_logic;

begin
	adder0: adder port map(
	A => A(0),
	B => B(0),
	c_in => c_in,
	S => G(0),
	c_out => c0);
	
	adder1: adder port map(
	A => A(1),
	B => B(1),
	c_in => c_in,
	S => G(1),
	c_out => c0);

	adder2: adder port map(
	A => A(2),
	B => B(2),
	c_in => c_in,
	S => G(2),
	c_out => c2);

	adder3: adder port map(
	A => A(3),
	B => B(3),
	c_in => c_in,
	S => G(3),
	c_out => c3);

	adder4: adder port map(
	A => A(4),
	B => B(4),
	c_in => c_in,
	S => G(4),
	c_out => c4);

	adder5: adder port map(
	A => A(5),
	B => B(5),
	c_in => c_in,
	S => G(5),
	c_out => c5);

	adder6: adder port map(
	A => A(6),
	B => B(6),
	c_in => c_in,
	S => G(6),
	c_out => c6);

	adder7: adder port map(
	A => A(7),
	B => B(7),
	c_in => c_in,
	S => G(7),
	c_out => c7);

	adder8: adder port map(
	A => A(8),
	B => B(8),
	c_in => c_in,
	S => G(8),
	c_out => c8);

	adder9: adder port map(
	A => A(9),
	B => B(9),
	c_in => c_in,
	S => G(9),
	c_out => c9);

	adder10: adder port map(
	A => A(10),
	B => B(10),
	c_in => c_in,
	S => G(10),
	c_out => c10);

	adder11: adder port map(
	A => A(11),
	B => B(11),
	c_in => c_in,
	S => G(11),
	c_out => c11);

	adder12: adder port map(
	A => A(12),
	B => B(12),
	c_in => c_in,
	S => G(12),
	c_out => c12);

	adder13: adder port map(
	A => A(13),
	B => B(13),
	c_in => c_in,
	S => G(13),
	c_out => c13);

	adder14: adder port map(
	A => A(14),
	B => B(14),
	c_in => c_in,
	S => G(14),
	c_out => c14);

	adder15: adder port map(
	A => A(15),
	B => B(15),
	c_in => c_in,
	S => G(15),
	c_out => c15);
	
	c_out <= c15;
	V <= c14 xor c15;

end behavioral;