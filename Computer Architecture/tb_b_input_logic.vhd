library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity b_input_logic_tb is
end;

architecture bench of b_input_logic_tb is

  component b_input_logic
      port (
  		s0 : in std_logic;
  		s1 : in std_logic;
  		B : in std_logic_vector (15 downto 0);
  		Y : out std_logic_vector (15 downto 0));
  end component;

  signal s0: std_logic;
  signal s1: std_logic;
  signal B: std_logic_vector (15 downto 0);
  signal Y: std_logic_vector (15 downto 0);

    constant clk_period: Time := 5 ns;

begin

  uut: b_input_logic port map ( s0 => s0,
                                s1 => s1,
                                B  => B,
                                Y  => Y );

  stimulus: process
  begin
  
    B <= "1010101010101010";
    -- this is the first test signal
    
    wait for clk_period;
    s0 <= '0';
    s1 <= '0';
    -- Y = all 0s
    
    wait for clk_period;
    s0 <= '0';
    s1 <= '1';
    -- Y = B = 1010101010101010
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '0';
    -- Y = !B = 0101010101010101
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '1';
    -- Y = all 1s

    wait;
  end process;


end;