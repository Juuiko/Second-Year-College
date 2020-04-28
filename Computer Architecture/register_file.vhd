library ieee;
use ieee.std_logic_1164.all;

entity register_file is
    Port (  write : in std_logic;
            clk : in std_logic;
			D_select : in std_logic_vector(2 downto 0);
			D_data : in std_logic_vector(15 downto 0);
			A_select : in std_logic_vector(2 downto 0);
			A_data : out std_logic_vector(15 downto 0);
			B_select : in std_logic_vector(2 downto 0);
            B_data : out std_logic_vector(15 downto 0));
end register_file;

architecture behavioral of register_file is

component reg16 port(
    D: in std_logic_vector(15 downto 0);
    load : in std_logic;
    clk : in std_logic;
    Q : out std_logic_vector(15 downto 0));
end component;

component decoder3_8 port(
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

component mux8_16 port(
    in0 : in std_logic_vector(15 downto 0);
    in1 : in std_logic_vector(15 downto 0);
    in2 : in std_logic_vector(15 downto 0);
    in3 : in std_logic_vector(15 downto 0);
    in4 : in std_logic_vector(15 downto 0);
    in5 : in std_logic_vector(15 downto 0);
    in6 : in std_logic_vector(15 downto 0);
    in7 : in std_logic_vector(15 downto 0);
    S : in std_logic_vector(2 downto 0);
    Z   : out std_logic_vector(15 downto 0));
end component;

signal sel_reg0 : std_logic;
signal sel_reg1 : std_logic;
signal sel_reg2 : std_logic;
signal sel_reg3 : std_logic;
signal sel_reg4 : std_logic;
signal sel_reg5 : std_logic;
signal sel_reg6 : std_logic;
signal sel_reg7 : std_logic;

signal load_reg0 : std_logic;
signal load_reg1 : std_logic;
signal load_reg2 : std_logic;
signal load_reg3 : std_logic;
signal load_reg4 : std_logic;
signal load_reg5 : std_logic;
signal load_reg6 : std_logic;
signal load_reg7 : std_logic;

signal Q_reg0 : std_logic_vector(15 downto 0);
signal Q_reg1 : std_logic_vector(15 downto 0);
signal Q_reg2 : std_logic_vector(15 downto 0);
signal Q_reg3 : std_logic_vector(15 downto 0);
signal Q_reg4 : std_logic_vector(15 downto 0);
signal Q_reg5 : std_logic_vector(15 downto 0);
signal Q_reg6 : std_logic_vector(15 downto 0);
signal Q_reg7 : std_logic_vector(15 downto 0);

begin

decoder : decoder3_8 port map(
    A => D_select,
    q0 => sel_reg0,
    q1 => sel_reg1,
    q2 => sel_reg2,
    q3 => sel_reg3,
    q4 => sel_reg4,
    q5 => sel_reg5,
    q6 => sel_reg6,
    q7 => sel_reg7);
    
load_reg0 <= sel_reg0 and write;
load_reg1 <= sel_reg1 and write;
load_reg2 <= sel_reg2 and write;
load_reg3 <= sel_reg3 and write;
load_reg4 <= sel_reg4 and write;
load_reg5 <= sel_reg5 and write;
load_reg6 <= sel_reg6 and write;
load_reg7 <= sel_reg7 and write;

reg0 : reg16 port map(D => D_data, load => load_reg0, clk => clk, Q => Q_reg0);
reg1 : reg16 port map(D => D_data, load => load_reg1, clk => clk, Q => Q_reg1); 
reg2 : reg16 port map(D => D_data, load => load_reg2, clk => clk, Q => Q_reg2);  
reg3 : reg16 port map(D => D_data, load => load_reg3, clk => clk, Q => Q_reg3);  
reg4 : reg16 port map(D => D_data, load => load_reg4, clk => clk, Q => Q_reg4);  
reg5 : reg16 port map(D => D_data, load => load_reg5, clk => clk, Q => Q_reg5);
reg6 : reg16 port map(D => D_data, load => load_reg6, clk => clk, Q => Q_reg6); 
reg7 : reg16 port map(D => D_data, load => load_reg7, clk => clk, Q => Q_reg7);
    
muxA : mux8_16 port map(
    in0 => Q_reg0,
    in1 => Q_reg1,
    in2 => Q_reg2,
    in3 => Q_reg3,
    in4 => Q_reg4,
    in5 => Q_reg5,
    in6 => Q_reg6,
    in7 => Q_reg7,
    S => A_select,
    Z => A_data);
    
muxB : mux8_16 port map(
    in0 => Q_reg0,
    in1 => Q_reg1,
    in2 => Q_reg2,
    in3 => Q_reg3,
    in4 => Q_reg4,
    in5 => Q_reg5,
    in6 => Q_reg6,
    in7 => Q_reg7,
    S => B_select,
    Z => B_data);
end behavioral;