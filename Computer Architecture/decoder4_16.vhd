library ieee;
use ieee.std_logic_1164.all;

entity decoder4_16 is
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
end decoder4_16;

architecture behavioral of decoder4_16 is

begin

	q0  <= '1' when (A="0000") else '0';
	q1  <= '1' when (A="0001") else '0';
	q2  <= '1' when (A="0010") else '0';
	q3  <= '1' when (A="0011") else '0';
	q4  <= '1' when (A="0100") else '0';
	q5  <= '1' when (A="0101") else '0';
	q6  <= '1' when (A="0110") else '0';
	q7  <= '1' when (A="0111") else '0';
	q8  <= '1' when (A="1000") else '0';
	q9  <= '1' when (A="1001") else '0';
	q10 <= '1' when (A="1010") else '0';
	q11 <= '1' when (A="1011") else '0';
	q12 <= '1' when (A="1100") else '0';
	q13 <= '1' when (A="1101") else '0';
	q14 <= '1' when (A="1110") else '0';
	q15 <= '1' when (A="1111") else '0';
	
end behavioral;
