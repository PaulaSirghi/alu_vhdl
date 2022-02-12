----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.11.2021 13:35:36
-- Design Name: 
-- Module Name: UC_mul - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UC_mul is
  Port (op: in std_logic_vector(2 downto 0);
        clk: in std_logic;
        b0: in std_logic;   --bitul 0 al celui de-al doilea operand
        enable: in std_logic;
        load: out std_logic;
        shift: out std_logic;
        sum: out std_logic;
        zero: out std_logic  --cand numaratorulajunge la 0 incheiem algoritmul
        );
end UC_mul;

architecture Behavioral of UC_mul is

type states is(start,initreg,verifb0,adder,shifter);
signal s:states;
signal Q:std_logic_vector(4 downto 0):="11111";   --initializam contorul cu 31
signal sem: std_logic;
begin

process(clk)
begin
if rising_edge(clk) then 
   case s is 
   when start => if enable='1' and op ="100" then
                 s<=initreg; 
                 else s<=start;
                 end if;
                
   when initreg => s<=verifb0; zero<='0';
   when verifb0 => if b0='1' then --si adunam si shiftam
                         s<=adder;
                      else
                         s<=shifter;  --doar shiftam
                      end if;                    
   when adder => s<=shifter;
   when shifter => if Q="00000" then  Q<="11111"; s<=start;zero<='1';
                   else Q<=Q-'1'; s<=verifb0;  zero<='0';  --nu s-au executat 31 de repetari incrementam contorul
                   end if;
   end case;
end if;
end process;

sum<='1' when s=adder else '0';
shift<='1' when s=shifter else '0';
load<='1' when s=initreg else '0';
end Behavioral;
