library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity lc16_tb is
end;

architecture bench of lc16_tb is

  component lc16
      port ( 
  		A : in std_logic_vector (15 downto 0);
          B : in std_logic_vector (15 downto 0);
          s0 : in std_logic;
          s1 : in std_logic;
          G : out std_logic_vector (15 downto 0));
  end component;

  signal A: std_logic_vector (15 downto 0);
  signal B: std_logic_vector (15 downto 0);
  signal s0: std_logic;
  signal s1: std_logic;
  signal G: std_logic_vector (15 downto 0);

    constant clk_period: Time := 5 ns;

begin

  uut: lc16 port map ( A  => A,
                       B  => B,
                       s0 => s0,
                       s1 => s1,
                       G  => G );

  stimulus: process
  begin
  
    wait for clk_period;
    A <= "0000000000000000";
    B <= "0000000000000000";
    s0 <= '0';
    s1 <= '0';
    -- G = 0x0000 AND 0x0000 = 0x0000
    
    wait for clk_period;
    s0 <= '0';
    s1 <= '1';
    -- G = 0x0000 OR 0x0000 = 0x0000
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '0';
    -- Gi = 0x0000 XOR 0x0000 = 0
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '1';
    -- Gi = NOT 0x0000 = 0xFFFF
    
    wait for clk_period;
    A <= "0000000000000000";
    B <= "1111111111111111";
    s0 <= '0';
    s1 <= '0';
    -- Gi = 0x0000 AND 0xFFFF = 0X0000
    
    wait for clk_period;
    s0 <= '0';
    s1 <= '1';
    -- Gi = 0x0000 OR 0XFFFF = 0XFFFF
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '0';
    -- Gi = 0x0000 XOR 0xFFFF = 0XFFFF
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '1';
    -- Gi = NOT 0x0000 = 0xFFFF
    
    wait for clk_period;
    A <= "1111111111111111";
    B <= "0000000000000000";
    s0 <= '0';
    s1 <= '0';
    -- Gi = 0xFFFF AND 0x0000 = 0x0000
    
    wait for clk_period;
    s0 <= '0';
    s1 <= '1';
    -- Gi = 0xFFFF OR 0x0000 = 0xFFFF
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '0';
    -- Gi = 0xFFFF XOR 0x0000 = 0xFFFF
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '1';
    -- Gi = NOT 0xFFFF = 0x0000
    
    wait for clk_period;
    A <= "1111111111111111";
    B <= "1111111111111111";
    s0 <= '0';
    s1 <= '0';
    -- Gi = 0xFFFF AND 0xFFFF = 0xFFFF
    
    wait for clk_period;
    s0 <= '0';
    s1 <= '1';
    -- Gi = 0xFFFF OR 0xFFFF = 0xFFFF
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '0';
    -- Gi = 0xFFFFF XOR 0xFFFF = 0x0000
    
    wait for clk_period;
    s0 <= '1';
    s1 <= '1';
    -- Gi = NOT 0xFFFF = 0x0000

    wait;
  end process;

end;