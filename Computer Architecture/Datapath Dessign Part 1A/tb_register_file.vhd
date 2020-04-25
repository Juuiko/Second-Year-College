library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity register_file_tb is
end;

architecture bench of register_file_tb is

  component register_file
  	port(
  		src_s0 : in std_logic;
  		src_s1 : in std_logic;
  		src_s2 : in std_logic;
  		dest : in std_logic_vector(2 downto 0);
  		clk : in std_logic;
  		data : in std_logic_vector(15 downto 0);
  		data_src : in std_logic;
  		reg_0 : out std_logic_vector(15 downto 0);
  		reg_1 : out std_logic_vector(15 downto 0);
  		reg_2 : out std_logic_vector(15 downto 0);
  		reg_3 : out std_logic_vector(15 downto 0);
  		reg_4 : out std_logic_vector(15 downto 0);
  		reg_5 : out std_logic_vector(15 downto 0);
  		reg_6 : out std_logic_vector(15 downto 0);
  		reg_7 : out std_logic_vector(15 downto 0)); 		
  end component;

  signal src_s0: std_logic;
  signal src_s1: std_logic;
  signal src_s2: std_logic;
  signal dest: std_logic_vector(2 downto 0);
  signal clk: std_logic;
  signal data: std_logic_vector(15 downto 0);
  signal data_src: std_logic;
  signal reg_0: std_logic_vector(15 downto 0);
  signal reg_1: std_logic_vector(15 downto 0);
  signal reg_2: std_logic_vector(15 downto 0);
  signal reg_3: std_logic_vector(15 downto 0);
  signal reg_4: std_logic_vector(15 downto 0);
  signal reg_5: std_logic_vector(15 downto 0);
  signal reg_6: std_logic_vector(15 downto 0);
  signal reg_7: std_logic_vector(15 downto 0);
  
    constant TbPeriod : time := 10 ns;
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

  uut: register_file port map ( src_s0   => src_s0,
                                src_s1   => src_s1,
                                src_s2   => src_s2,
                                dest     => dest,
                                clk      => clk,
                                data     => data,
                                data_src => data_src,
                                reg_0    => reg_0,
                                reg_1    => reg_1,
                                reg_2    => reg_2,
                                reg_3    => reg_3,
                                reg_4    => reg_4,
                                reg_5    => reg_5,
                                reg_6    => reg_6,
                                reg_7    => reg_7 );

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';
    clk <= TbClock;

  stimulus: process
  begin
 
-- load "aaaa" in all 8 registers 
  
data_src <= '0';
data <= x"aaaa";
dest <= '000';
wait for 10 ns;

dest <= '001';
wait for 10 ns;

dest <= '010';
wait for 10 ns;

dest <= '011';
wait for 10 ns;

dest <= '100';
wait for 10 ns;

dest <= '101';
wait for 10 ns;

dest <= '110';
wait for 10 ns;

dest <= '111';
wait for 10 ns;

-- transfer "bbbb" from one register (R0) to another (R7)

data <= x"bbbb";
dest <= '000';
wait for 10 ns;

data_src <= '1';
src <= '000';
dest <= '111';
wait for 10 ns;

    wait;
  end process;


end;