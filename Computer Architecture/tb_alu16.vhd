library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity alu16_tb is
end;

architecture bench of alu16_tb is

  component alu16
      port ( 
  		A : in std_logic_vector (15 downto 0);
  		B : in std_logic_vector (15 downto 0);
  		s0 : in std_logic;
  		s1 : in std_logic;
  		s2 : in std_logic;
  		c_in : in std_logic;
  		c_out : out std_logic;
  		G : out std_logic_vector (15 downto 0);
  		V : out std_logic);
  end component;

  signal A: std_logic_vector (15 downto 0);
  signal B: std_logic_vector (15 downto 0);
  signal s0: std_logic;
  signal s1: std_logic;
  signal s2: std_logic;
  signal c_in: std_logic;
  signal c_out: std_logic;
  signal G: std_logic_vector (15 downto 0);
  signal V: std_logic;

  constant clk_period: Time := 40 ns;

begin

  uut: alu16 port map ( A     => A,
                        B     => B,
                        s0    => s0,
                        s1    => s1,
                        s2    => s2,
                        c_in  => c_in,
                        c_out => c_out,
                        G     => G,
                        V     => V );

  stimulus: process
  begin
  
    A <= "1010101010101010";
    B <= "0101010101010101";
    -- Keep these signals the same throughout the testbench
    -- Check the various operations on them and look at outputs
    -- A = 0xAAAA, B = 0x5555
    
    s2 <= '0';
    s1 <= '0';
    s0 <= '0';
    c_in <= '0';
    wait for clk_period;
    -- G = A = 0xAAAA
    -- c_out = 0
    
    s2 <= '0';
    s1 <= '0';
    s0 <= '0';
    c_in <= '1';
    wait for clk_period;
    -- G = A+1 = 0xAAAB
    -- c_out = 0
    
    s2 <= '0';
    s1 <= '0';
    s0 <= '1';
    c_in <= '0';
    wait for clk_period;
    -- G = A+B = 0xFFFF
    -- c_out = 0

    s2 <= '0';
    s1 <= '0';
    s0 <= '1';
    c_in <= '1';
    wait for clk_period;
    -- G = A+B+1 = 0xFFFF
    -- c_out = 1
    
    s2 <= '0';
    s1 <= '1';
    s0 <= '0';
    c_in <= '0';
    wait for clk_period;
    -- G = A+not(B) = 0x5554
    -- c_out = 1
    
    s2 <= '0';
    s1 <= '1';
    s0 <= '0';
    c_in <= '1';
    wait for clk_period;
    -- G = A+not(B)+1 = 0x5555
    -- c_out = 1
    
    s2 <= '0';
    s1 <= '1';
    s0 <= '1';
    c_in <= '0';
    wait for clk_period;
    -- G = A+0xFFFF = 0xAAA9
    -- c_out = 1
    
    s2 <= '0';
    s1 <= '1';
    s0 <= '1';
    c_in <= '1';
    wait for clk_period;
    -- G = A+0xFFFF+1 = 0xAAAA
    -- c_out = 1
    
    s2 <= '1';
    s1 <= '0';
    s0 <= '0';
    wait for clk_period;
    -- G = A AND B = 0x0000
    
    s2 <= '1';
    s1 <= '0';
    s0 <= '1';
    wait for clk_period;
    -- G = A OR B = 0xFFFF
    
    s2 <= '1';
    s1 <= '1';
    s0 <= '0';
    wait for clk_period;
    -- G = A XOR B = 0xFFFF
    
    s2 <= '1';
    s1 <= '1';
    s0 <= '1';
    wait for clk_period;
    -- G = NOT A = 0x5555

    wait;
  end process;


end;