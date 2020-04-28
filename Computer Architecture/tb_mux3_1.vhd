library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux3_1_tb is
end;

architecture bench of mux3_1_tb is

  component mux3_1
      port (
          in0 : in std_logic;
          in1 : in std_logic;
          in2 : in std_logic;
          S : in std_logic_vector(1 downto 0); 
          Q : out std_logic);
  end component;

  signal in0: std_logic;
  signal in1: std_logic;
  signal in2: std_logic;
  signal S: std_logic_vector(1 downto 0);
  signal Q: std_logic;

begin

  uut: mux3_1 port map ( in0 => in0,
                         in1 => in1,
                         in2 => in2,
                         S   => S,
                         Q   => Q );

  stimulus: process
  begin
  
    In0 <= '1';
    In1 <= '0';
    In2 <= '1';
    S <= "00";
    wait for 10 ns;

    S <= "01";
    wait for 10 ns;

    S <= "10";
    wait;
  end process;

end;