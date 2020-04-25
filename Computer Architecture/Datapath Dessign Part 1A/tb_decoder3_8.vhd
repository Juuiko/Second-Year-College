library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity decoder3_8_tb is
end;

architecture bench of decoder3_8_tb is

  component decoder3_8
  	port(
  		A : in std_logic_vector(2 downto 0);
  		q0 : out std_logic;
  		q1 : out std_logic;
  		q2 : out std_logic;
  		q3 : out std_logic;
  		q4 : out std_logic;
  		q5 : out std_logic;
  		q6 : out std_logic;
  		q7 : out std_logic);		
  end component;

  signal A: std_logic_vector(2 downto 0);
  signal q0: std_logic;
  signal q1: std_logic;
  signal q2: std_logic;
  signal q3: std_logic;
  signal q4: std_logic;
  signal q5: std_logic;
  signal q6: std_logic;
  signal q7: std_logic;

begin

  uut: decoder3_8 port map ( A  => A,
                             q0 => q0,
                             q1 => q1,
                             q2 => q2,
                             q3 => q3,
                             q4 => q4,
                             q5 => q5,
                             q6 => q6,
                             q7 => q7 );

  stimulus: process
  begin

    A <= "000";
    wait for 10 ns;

    A <= "001";
    wait for 10 ns;

    A <= "010";
    wait for 10 ns;

    A <= "011";
    wait for 10 ns;

    A <= "100";
    wait for 10 ns;

    A <= "101";
    wait for 10 ns;

    A <= "110";
    wait for 10 ns;

    A <= "111";
    wait for 10 ns;

    A <= "000";

    wait;
  end process;


end;