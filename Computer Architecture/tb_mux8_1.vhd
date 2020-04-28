library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux8_1_tb is
end;

architecture bench of mux8_1_tb is

  component mux8_1
  	port(
  		in0 : in std_logic;
          in1 : in std_logic;
          in2 : in std_logic;
          in3 : in std_logic;
          in4 : in std_logic;
          in5 : in std_logic;
          in6 : in std_logic;
          in7 : in std_logic;
          s0 : in std_logic;
          s1 : in std_logic;
          s2 : in std_logic;
          Z : out std_logic);
  end component;

  signal in0: std_logic;
  signal in1: std_logic;
  signal in2: std_logic;
  signal in3: std_logic;
  signal in4: std_logic;
  signal in5: std_logic;
  signal in6: std_logic;
  signal in7: std_logic;
  signal s0: std_logic;
  signal s1: std_logic;
  signal s2: std_logic;
  signal Z: std_logic;

    constant clock: Time := 10 ns;

begin

  uut: mux8_1 port map ( in0 => in0,
                         in1 => in1,
                         in2 => in2,
                         in3 => in3,
                         in4 => in4,
                         in5 => in5,
                         in6 => in6,
                         in7 => in7,
                         s0  => s0,
                         s1  => s1,
                         s2  => s2,
                         Z   => Z );

  stimulus: process
  begin
  
    in0 <= '1';
    in1 <= '1';
    in2 <= '0';
    in3 <= '0';
    in4 <= '1';
    in5 <= '1';
    in6 <= '0';
    in7 <= '0';
    
    wait for clock;
    s0 <= '0';
    s1 <= '0';
    s2 <= '0';
    
    wait for clock;
    s0 <= '1';
    s1 <= '0';
    s2 <= '0';
    
    wait for clock;
    s0 <= '0';
    s1 <= '1';
    s2 <= '0';
    
    wait for clock;
    s0 <= '1';
    s1 <= '1';
    s2 <= '0';
    
    wait for clock;
    s0 <= '0';
    s1 <= '0';
    s2 <= '1';
    
    wait for clock;
    s0 <= '1';
    s1 <= '0';
    s2 <= '1';
    
    wait for clock;
    s0 <= '0';
    s1 <= '1';
    s2 <= '1';
    
    wait for clock;
    s0 <= '1';
    s1 <= '1';
    s2 <= '1';

    wait;
  end process;


end;