library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux8_16_tb is
end;

architecture bench of mux8_16_tb is

  component mux8_16
  	port(
  		in0 : in std_logic_vector(15 downto 0);
  		in1 : in std_logic_vector(15 downto 0);
  		in2 : in std_logic_vector(15 downto 0);
  		in3 : in std_logic_vector(15 downto 0);
  		in4 : in std_logic_vector(15 downto 0);
  		in5 : in std_logic_vector(15 downto 0);
  		in6 : in std_logic_vector(15 downto 0);
  		in7 : in std_logic_vector(15 downto 0);
  		S : in std_logic_vector(2 downto 0);
  		Z : out std_logic_vector(15 downto 0));
  end component;

  signal in0: std_logic_vector(15 downto 0);
  signal in1: std_logic_vector(15 downto 0);
  signal in2: std_logic_vector(15 downto 0);
  signal in3: std_logic_vector(15 downto 0);
  signal in4: std_logic_vector(15 downto 0);
  signal in5: std_logic_vector(15 downto 0);
  signal in6: std_logic_vector(15 downto 0);
  signal in7: std_logic_vector(15 downto 0);
  signal S: std_logic_vector(2 downto 0);
  signal Z: std_logic_vector(15 downto 0);

begin

  uut: mux8_16 port map ( in0 => in0,
                          in1 => in1,
                          in2 => in2,
                          in3 => in3,
                          in4 => in4,
                          in5 => in5,
                          in6 => in6,
                          in7 => in7,
                          S   => S,
                          Z   => Z );

  stimulus: process
  begin
  
    in0 <= x"aaaa";
    in1 <= x"bbbb";
    in2 <= x"cccc";
    in3 <= x"dddd";
    in4 <= x"eeee";
    in5 <= x"ffff";
    in6 <= x"abab";
    in7 <= x"baba";

    S <= "000";
    wait for 10 ns;

    S <= "001";
    wait for 10 ns;

    S <= "010";
    wait for 10 ns;

    S <= "011";
    wait for 10 ns;

    S <= "100";
    wait for 10 ns;

    S <= "101";
    wait for 10 ns;

    S <= "110";
    wait for 10 ns;

    S <= "111";
    wait for 10 ns;

    S <= "000";

    wait;
  end process;


end;