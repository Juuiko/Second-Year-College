library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity decoder4_16_tb is
end;

architecture bench of decoder4_16_tb is

  component decoder4_16
  	port(
  		A : in std_logic_vector(3 downto 0);
  		q0 : out std_logic;
  		q1 : out std_logic;
  		q2 : out std_logic;
  		q3 : out std_logic;
  		q4 : out std_logic;
  		q5 : out std_logic;
  		q6 : out std_logic;
  		q7 : out std_logic;
  		q8 : out std_logic;
  		q9 : out std_logic;
  		q10 : out std_logic;
  		q11 : out std_logic;
  		q12 : out std_logic;
  		q13 : out std_logic;
  		q14 : out std_logic;
  		q15 : out std_logic);		
  end component;

  signal A: std_logic_vector(3 downto 0);
  signal q0: std_logic;
  signal q1: std_logic;
  signal q2: std_logic;
  signal q3: std_logic;
  signal q4: std_logic;
  signal q5: std_logic;
  signal q6: std_logic;
  signal q7: std_logic;
  signal q8: std_logic;
  signal q9: std_logic;
  signal q10: std_logic;
  signal q11: std_logic;
  signal q12: std_logic;
  signal q13: std_logic;
  signal q14: std_logic;
  signal q15: std_logic;
  
    constant clock : time := 2 ns;

begin

  uut: decoder4_16 port map ( A   => A,
                              q0  => q0,
                              q1  => q1,
                              q2  => q2,
                              q3  => q3,
                              q4  => q4,
                              q5  => q5,
                              q6  => q6,
                              q7  => q7,
                              q8  => q8,
                              q9  => q9,
                              q10 => q10,
                              q11 => q11,
                              q12 => q12,
                              q13 => q13,
                              q14 => q14,
                              q15 => q15 );

  stimulus: process
  begin

    wait for clock;
    A(0) <= '0';
    A(1) <= '0';
    A(2) <= '0';
    A(3) <= '0';
    
    wait for clock;
    A(0) <= '1';
    A(1) <= '0';
    A(2) <= '0';
    A(3) <= '0';
    
    wait for clock;
    A(0) <= '0';
    A(1) <= '1';
    A(2) <= '0';
    A(3) <= '0';
    
    wait for clock;
    A(0) <= '1';
    A(1) <= '1';
    A(2) <= '0';
    A(3) <= '0';
    
    wait for clock;
    A(0) <= '0';
    A(1) <= '0';
    A(2) <= '1';
    A(3) <= '0';
    
    wait for clock;
    A(0) <= '1';
    A(1) <= '0';
    A(2) <= '1';
    A(3) <= '0';
    
    wait for clock;
    A(0) <= '0';
    A(1) <= '1';
    A(2) <= '1';
    A(3) <= '0';
    
    wait for clock;
    A(0) <= '1';
    A(1) <= '1';
    A(2) <= '1';
    A(3) <= '0';
    
    wait for clock;
    A(0) <= '0';
    A(1) <= '0';
    A(2) <= '0';
    A(3) <= '1';
    
    wait for clock;
    A(0) <= '1';
    A(1) <= '0';
    A(2) <= '0';
    A(3) <= '1';
    
    wait for clock;
    A(0) <= '0';
    A(1) <= '1';
    A(2) <= '0';
    A(3) <= '1';
    
    wait for clock;
    A(0) <= '1';
    A(1) <= '1';
    A(2) <= '0';
    A(3) <= '1';
    
    wait for clock;
    A(0) <= '0';
    A(1) <= '0';
    A(2) <= '1';
    A(3) <= '1';
    
    wait for clock;
    A(0) <= '1';
    A(1) <= '0';
    A(2) <= '1';
    A(3) <= '1';
    
    wait for clock;
    A(0) <= '0';
    A(1) <= '1';
    A(2) <= '1';
    A(3) <= '1';
    
     wait for clock;
    A(0) <= '1';
    A(1) <= '1';
    A(2) <= '1';
    A(3) <= '1';
    
    wait for clock;
    A(0) <= '0';
    A(1) <= '0';
    A(2) <= '0';
    A(3) <= '0';

    wait;
  end process;


end;