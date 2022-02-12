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

entity Rotate is
  Port (X: in std_logic_vector(31 downto 0);
        stg: in std_logic;
        op: in std_logic_vector(2 downto 0);
        rdy: out std_logic;
        rez: out std_logic_vector(63 downto 0));
end Rotate;

architecture Behavioral of Rotate is
component Mux1bitS is
  Port (en: in std_logic;
        A: in std_logic;
        B: in std_logic;
        s: in std_logic;
        rez: out std_logic);
end component;

signal en:std_logic:='0';
begin
rez(63 downto 32)<="00000000000000000000000000000000";

c1: Mux1bitS port map(en,X(0),X(30),stg,rez(31));
c2: Mux1bitS port map(en,X(31),X(29),stg,rez(30));
c3: Mux1bitS port map(en,X(30),X(28),stg,rez(29));
c4: Mux1bitS port map(en,X(29),X(27),stg,rez(28));
c5: Mux1bitS port map(en,X(28),X(26),stg,rez(27));
c6: Mux1bitS port map(en,X(27),X(25),stg,rez(26));
c7: Mux1bitS port map(en,X(26),X(24),stg,rez(25));
c8: Mux1bitS port map(en,X(25),X(23),stg,rez(24));
c9: Mux1bitS port map(en,X(24),X(22),stg,rez(23));
c10: Mux1bitS port map(en,X(23),X(21),stg,rez(22));
c11: Mux1bitS port map(en,X(22),X(20),stg,rez(21));
c12: Mux1bitS port map(en,X(21),X(19),stg,rez(20));
c13: Mux1bitS port map(en,X(20),X(18),stg,rez(19));
c14: Mux1bitS port map(en,X(19),X(17),stg,rez(18));
c15: Mux1bitS port map(en,X(18),X(16),stg,rez(17));
c16: Mux1bitS port map(en,X(17),X(15),stg,rez(16));
c17: Mux1bitS port map(en,X(16),X(14),stg,rez(15));
c18: Mux1bitS port map(en,X(15),X(13),stg,rez(14));
c19: Mux1bitS port map(en,X(14),X(12),stg,rez(13));
c20: Mux1bitS port map(en,X(13),X(11),stg,rez(12));
c21: Mux1bitS port map(en,X(12),X(10),stg,rez(11));
c22: Mux1bitS port map(en,X(11),X(9),stg,rez(10));
c23: Mux1bitS port map(en,X(10),X(8),stg,rez(9));
c24: Mux1bitS port map(en,X(9),X(7),stg,rez(8));
c25: Mux1bitS port map(en,X(8),X(6),stg,rez(7));
c26: Mux1bitS port map(en,X(7),X(5),stg,rez(6));
c27: Mux1bitS port map(en,X(6),X(4),stg,rez(5));
c28: Mux1bitS port map(en,X(5),X(3),stg,rez(4));
c29: Mux1bitS port map(en,X(4),X(2),stg,rez(3));
c30: Mux1bitS port map(en,X(3),X(1),stg,rez(2));
c31: Mux1bitS port map(en,X(2),X(0),stg,rez(1));
c32: Mux1bitS port map(en,X(1),X(31),stg,rez(0));
rdy<='1';

end Behavioral;
