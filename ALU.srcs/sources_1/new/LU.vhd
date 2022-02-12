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

entity LU is
  Port (A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        op: in std_logic_vector(2 downto 0);
        sel: in std_logic_vector(1 downto 0);
        sA: in std_logic;
        sB: in std_logic;
        sRez: out std_logic;
        rdy: out std_logic;
        rez: out std_logic_vector(63 downto 0));
end LU;

architecture Behavioral of LU is

begin

process(A,B,op,sA,sB,sel)
begin
    if op="010" then
        case sel is
        when "00" => rez(31 downto 0)<=A and B; sRez<=sA and sB;rdy<='1';  
        when "01" => rez(31 downto 0)<=A or B; sRez<=sA or sB;rdy<='1';  
        when "10" => rez(31)<=not A(31); sRez<=not sA;
        rez(30)<=not A(30);rez(29)<=not A(29);rez(28)<=not A(28);rez(27)<=not A(27);rez(26)<=not A(26);
        rez(25)<=not A(25);rez(24)<=not A(24); rez(23)<=not A(23); rez(22)<=not A(22);rez(21)<=not A(21);
        rez(20)<=not A(20);rez(19)<=not A(19);rez(18)<=not A(18);rez(17)<=not A(17);rez(16)<=not A(16);
        rez(15)<=not A(15);rez(14)<=not A(14);rez(13)<=not A(13); rez(12)<=not A(12);rez(11)<=not A(11);
        rez(10)<=not A(10); rez(9)<=not A(9); rez(8)<=not A(8);rez(7)<=not A(7); rez(6)<=not A(6);
        rez(5)<=not A(5); rez(4)<=not A(4);rez(3)<=not A(3);rez(2)<=not A(2);rez(1)<=not A(1); rez(0)<=not A(0);  
        rdy<='1';  
        when others => rez<=X"FFFFFFFFFFFFFFFF";rdy<='0';
        end case;
        rez(63 downto 32)<="00000000000000000000000000000000";
    end if; 
end process;

end Behavioral;
