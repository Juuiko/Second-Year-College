library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux4_1_tb is
end;

architecture bench of mux4_1_tb is

  component mux4_1
      port ( 
          s0 : in std_logic;
          s1 : in std_logic;
          in0 : in std_logic;
          in1 : in std_logic;
          in2 : in std_logic;
          in3 : in std_logic;
          out0 : out std_logic);
  end component;

  signal s0: std_logic;
  signal s1: std_logic;
  signal in0: std_logic;
  signal in1: std_logic;
  signal in2: std_logic;
  signal in3: std_logic;
  signal out0: std_logic;

begin

  uut: mux4_1 port map ( s0   => s0,
                         s1   => s1,
                         in0  => in0,
                         in1  => in1,
                         in2  => in2,
                         in3  => in3,
                         out0 => out0 );

  stimulus: process
  begin
  
    In0 <= '1';
    In1 <= '0';
    In2 <= '1';
    In3 <= '0';
    S0 <= '0';
    S1 <= '0';
    wait for 10 ns;

    S1 <= '1'; 
    wait for 10 ns;

    S0 <= '1';
    S1 <= '0';
    wait for 10 ns;

    S1 <= '1'; 
    wait;
  end process;

end;