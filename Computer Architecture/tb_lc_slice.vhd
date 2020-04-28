library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity lc_slice_tb is
end;

architecture bench of lc_slice_tb is

  component lc_slice
      port ( 
  	  s0 : in std_logic;
      s1 : in std_logic;
      A : in std_logic;
      B : in std_logic;
      G : out std_logic);
  end component;

  signal s0: std_logic;
  signal s1: std_logic;
  signal A: std_logic;
  signal B: std_logic;
  signal G: std_logic;

  constant clk_period: Time := 20 ns;

begin

  uut: lc_slice port map ( s0 => s0,
                           s1 => s1,
                           A  => A,
                           B  => B,
                           G  => G );

  stimulus: process
  begin
  
    wait for clk_period;
    A <= '0';
    B <= '0';
    s0 <= '0';
    s1 <= '0';
    -- Gi = 0 AND 0 = 0
    
    wait for clk_period;
    s0 <= '0';
    s1 <= '1';
    -- Gi = 0 OR 0 = 0
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '0';
    -- Gi = 0 XOR 0 = 0
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '1';
    -- Gi = NOT 0 = 1
    
    wait for clk_period;
    A <= '0';
    B <= '1';
    s0 <= '0';
    s1 <= '0';
    -- Gi = 0 AND 1 = 0
    
    wait for clk_period;
    s0 <= '0';
    s1 <= '1';
    -- Gi = 0 OR 1 = 1
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '0';
    -- Gi = 0 XOR 1 = 1
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '1';
    -- Gi = NOT 0 = 1
    
    wait for clk_period;
    A <= '1';
    B <= '0';
    s0 <= '0';
    s1 <= '0';
    -- Gi = 1 AND 0 = 0
    
    wait for clk_period;
    s0 <= '0';
    s1 <= '1';
    -- Gi = 1 OR 0 = 1
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '0';
    -- Gi = 1 XOR 0 = 1
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '1';
    -- Gi = NOT 1 = 0
    
    wait for clk_period;
    A <= '1';
    B <= '1';
    s0 <= '0';
    s1 <= '0';
    -- Gi = 1 AND 1 = 1
    
    wait for clk_period;
    s0 <= '0';
    s1 <= '1';
    -- Gi = 1 OR 1 = 1
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '0';
    -- Gi = 1 XOR 1 = 0
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '1';
    -- Gi = NOT 1 = 0
    
    wait;

  end process;


end;