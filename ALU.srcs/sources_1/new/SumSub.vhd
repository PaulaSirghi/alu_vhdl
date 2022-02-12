----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2021 14:16:21
-- Design Name: 
-- Module Name: RegStare - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SumSub is
  Port (A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        sel: in std_logic;
        op: in std_logic_vector(2 downto 0);
        Cout: out std_logic;
        rdy: out std_logic;
        S: out std_logic_vector(63 downto 0));
end SumSub;

architecture Behavioral of SumSub is

component oneBitAdder is
 Port (a,b,ci,sel: in std_logic;
       op: in std_logic_vector(2 downto 0);
       s,co: out std_logic
       );
end component;
signal carry: std_logic_vector(31 downto 0):="00000000000000000000000000000000";

begin

c1: oneBitAdder port map(A(0),B(0),Carry(0),sel,op,S(0),Carry(1));
c2: oneBitAdder port map(A(1),B(1),Carry(1),sel,op,S(1),Carry(2));
c3: oneBitAdder port map(A(2),B(2),Carry(2),sel,op,S(2),Carry(3));
c4: oneBitAdder port map(A(3),B(3),Carry(3),sel,op,S(3),Carry(4));
c5: oneBitAdder port map(A(4),B(4),Carry(4),sel,op,S(4),Carry(5));
c6: oneBitAdder port map(A(5),B(5),Carry(5),sel,op,S(5),Carry(6));
c7: oneBitAdder port map(A(6),B(6),Carry(6),sel,op,S(6),Carry(7));
c8: oneBitAdder port map(A(7),B(7),Carry(7),sel,op,S(7),Carry(8));
c9: oneBitAdder port map(A(8),B(8),Carry(8),sel,op,S(8),Carry(9));
c10: oneBitAdder port map(A(9),B(9),Carry(9),sel,op,S(9),Carry(10));
c11: oneBitAdder port map(A(10),B(10),Carry(10),sel,op,S(10),Carry(11));
c12: oneBitAdder port map(A(11),B(11),Carry(11),sel,op,S(11),Carry(12));
c13: oneBitAdder port map(A(12),B(12),Carry(12),sel,op,S(12),Carry(13));
c14: oneBitAdder port map(A(13),B(13),Carry(13),sel,op,S(13),Carry(14));
c15: oneBitAdder port map(A(14),B(14),Carry(14),sel,op,S(14),Carry(15));
c16: oneBitAdder port map(A(15),B(15),Carry(15),sel,op,S(15),Carry(16));
c17: oneBitAdder port map(A(16),B(16),Carry(16),sel,op,S(16),Carry(17));
c18: oneBitAdder port map(A(17),B(17),Carry(17),sel,op,S(17),Carry(18));
c19: oneBitAdder port map(A(18),B(18),Carry(18),sel,op,S(18),Carry(19));
c20: oneBitAdder port map(A(19),B(19),Carry(19),sel,op,S(19),Carry(20));
c21: oneBitAdder port map(A(20),B(20),Carry(20),sel,op,S(20),Carry(21));
c22: oneBitAdder port map(A(21),B(21),Carry(21),sel,op,S(21),Carry(22));
c23: oneBitAdder port map(A(22),B(22),Carry(22),sel,op,S(22),Carry(23));
c24: oneBitAdder port map(A(23),B(23),Carry(23),sel,op,S(23),Carry(24));
c25: oneBitAdder port map(A(24),B(24),Carry(24),sel,op,S(24),Carry(25));
c26: oneBitAdder port map(A(25),B(25),Carry(25),sel,op,S(25),Carry(26));
c27: oneBitAdder port map(A(26),B(26),Carry(26),sel,op,S(26),Carry(27));
c28: oneBitAdder port map(A(27),B(27),Carry(27),sel,op,S(27),Carry(28));
c29: oneBitAdder port map(A(28),B(28),Carry(28),sel,op,S(28),Carry(29));
c30: oneBitAdder port map(A(29),B(29),Carry(29),sel,op,S(29),Carry(30));
c31: oneBitAdder port map(A(30),B(30),Carry(30),sel,op,S(30),Carry(31));
c32: oneBitAdder port map(A(31),B(31),Carry(31),sel,op,S(31),Cout);
S(63 downto 32)<="00000000000000000000000000000000";
rdy<='1';

end Behavioral;
