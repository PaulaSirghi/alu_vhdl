----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.11.2021 15:44:47
-- Design Name: 
-- Module Name: inmultitor - Behavioral
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

entity ALU is
  Port ( 
  clk1: in std_logic;
  rezultat: out std_logic_vector(63 downto 0);
  sz: out std_logic
   );
end ALU;

architecture Behavioral of ALU is
component inmultitor is
  Port ( op: in std_logic_vector(2 downto 0);
  RX: in std_logic_vector(31 downto 0);
  sx: in std_logic;
  RY: in std_logic_vector(31 downto 0);
  sy: in std_logic;
  clk1: in std_logic;
  start: in std_logic;
  ovf: out std_logic;
  zero: out std_logic;
  rdy: out std_logic;
  ACC: out std_logic_vector(63 downto 0);
  sz: out std_logic
   );
end component;


component InstrF is
    Port ( 
           clk : in STD_LOGIC;
           en: in std_logic:='0';
           reset: in std_logic:='0';
           i   : out  STD_LOGIC_VECTOR (67 downto 0);
           PC_o   : out STD_LOGIC_VECTOR (31 downto 0));
          
end component;

component counter is
  Port (D: in std_logic_vector(4 downto 0);
        clk: in std_logic;
        en: in std_logic;
        Q: out std_logic_vector(4 downto 0));
end component;

component SumSub is
  Port (A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        sel: in std_logic;
        op: in std_logic_vector(2 downto 0);
        Cout: out std_logic;
        rdy: out std_logic;
        S: out std_logic_vector(63 downto 0));
end component;

component UC is
 Port (I: in std_logic_vector(3 downto 0);
        sel: out std_logic;
        op: out std_logic_vector(2 downto 0);
        stg: out std_logic;
        logic: out std_logic_vector(1 downto 0));
end component;

component LU is
  Port (A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        op: in std_logic_vector(2 downto 0);
        sel: in std_logic_vector(1 downto 0);
        sA: in std_logic;
        sB: in std_logic;
        sRez: out std_logic;
        rdy: out std_logic;
        rez: out std_logic_vector(63 downto 0));
end component;

component RegStare is
Port ( zero: in std_logic;
       overflow: in std_logic;
       sign: in std_logic;
       Carry: in std_logic
 );
end component;

component ID is
  Port ( instr: in std_logic_vector(67 downto 0);
        opcode: out std_logic_vector(3 downto 0);
        a: out std_logic_vector(31 downto 0);
        b: out std_logic_vector(31 downto 0) );
end component;
component Rotate is
  Port (X: in std_logic_vector(31 downto 0);
        stg: in std_logic;
        op: in std_logic_vector(2 downto 0);
        rdy: out std_logic;
        rez: out std_logic_vector(63 downto 0));
end component;

component selRez is
  Port ( op: in std_logic_vector(2 downto 0);
         LU: in std_logic_vector(63 downto 0);
         Sum: in std_logic_vector(63 downto 0);
         Mul: in std_logic_vector(63 downto 0);
         Div: in std_logic_vector(63 downto 0);
         LUd: in std_logic;
         Sumd: in std_logic;
         Muld: in std_logic;
         Divd: in std_logic;
         Rez: out std_logic_vector(63 downto 0);
         en: out std_logic);
end component;

component div is
  Port ( RX: in std_logic_vector(31 downto 0);
  sx: in std_logic;
  RY: in std_logic_vector(31 downto 0);
  sy: in std_logic;
  clk: in std_logic;
  start: in std_logic;
  ovf: out std_logic;
  zero: out std_logic;
  rdy: out std_logic;
  rez: out std_logic_vector(63 downto 0);
  sz: out std_logic
   );
end component;

signal x: std_logic_vector(31 downto 0):="00000000000000000000000000000000";
signal y: std_logic_vector(31 downto 0):="00000000000000000000000000000000";
signal sx: std_logic:='0';
signal sy: std_logic:='0';
signal rezLU: std_logic_vector(63 downto 0):="0000000000000000000000000000000000000000000000000000000000000000";
signal rezRotate: std_logic_vector(63 downto 0):="0000000000000000000000000000000000000000000000000000000000000000";
signal rezS: std_logic_vector(63 downto 0):="0000000000000000000000000000000000000000000000000000000000000000";
signal rezMul: std_logic_vector(63 downto 0):="0000000000000000000000000000000000000000000000000000000000000000";
signal sel: std_logic:='0';
signal opcode:  std_logic_vector(3 downto 0):="0000";
signal stg:  std_logic:='0';
signal zero:  std_logic:='0';
signal ovf:  std_logic:='0';
signal signS:  std_logic:='0';
signal signM:  std_logic:='0';
signal signL:  std_logic:='0';
signal sign:  std_logic:='0';
signal logic: std_logic_vector(1 downto 0):="00";
signal reset: std_logic:='0';
signal instruction   :   STD_LOGIC_VECTOR (67 downto 0):="00000000000000000000000000000000000000000000000000000000000000000000";
signal PC_o :  STD_LOGIC_VECTOR (31 downto 0):="00000000000000000000000000000000";
signal op1:  std_logic_vector(2 downto 0):="000";
signal Carry: std_logic:='0';
signal rdy: std_logic:='0';
signal rdyLU: std_logic:='0';
signal rdySumSub: std_logic:='0';
signal rdyInmultitor: std_logic:='0';
signal rdyRotate: std_logic:='0';
signal clk: std_LOGIC:='0';
signal start: std_logic:='0';
signal start_div: std_logic:='0';
signal ovfd: std_logic;
signal zerod: std_logic;
signal rdyd: std_logic;
signal rezd: std_logic_vector(63 downto 0);
signal szd:std_logic;
begin

clk<=not clk after 20 ns;

c1: InstrF port map(clk,rdy,reset, instruction,pc_o);
c2: ID port map(instruction,opcode,x,y);
c3: UC port map(opcode,sel,op1,stg,logic);
c4: LU port map(x,y,op1,logic,sx,sy,signL,rdyLU,rezLU);
c5: SumSub port map(x,y,sel,op1,Carry,rdySumSub,rezS);
c6: Rotate port map(y,stg,op1,rdyRotate,rezRotate);
c7: inmultitor port map(op1,x,sx,y,sy,clk,start,ovf,zero,rdyInmultitor,rezMul,signM);
c8: RegStare port map(zero,ovf,sign,Carry);
c9: div port map(x,sx,y,sy,clk,start_div,ovfd,zerod,rdyd,rezd,szd);
process(op1,rdyInmultitor,rdySumSub,rdyLU,rdyRotate,signs,signl,signm,rezd,rdyd)
begin

   case op1 is
   when "000"=>start<='0';sz<=signs;sign<=signs;rdy<=rdySumSub;
   when "010"=>start<='0';sz<=signl;sign<=signl;rdy<=rdyLU;
   when "011"=>start<='0';rdy<=rdyRotate;
   when "100"=>start<='1';sz<=signm;sign<=signm;rdy<=rdyInmultitor;
   when "101"=>start_div<='1';rdy<=rdyd;
   when others=>rdy<='1';
   end case;

end process;

process(op1,rezS,rezLu,rezRotate,rdy,rezMul,rezd)
begin
   if rdy='1' then
       case op1 is
       when "000"=>rezultat<=rezS;
       when "010"=>rezultat<=rezLu;
       when "011"=>rezultat<=rezRotate;
       when "100"=>rezultat<=rezMul;sz<=signm;sign<=signm;
       when "101"=>rezultat<=rezd;sz<=szd;sign<=szd;
       when others=>rezultat<="0000000000000000000000000000000000000000000000000000000000000000";
       end case;
   end if;
end process;
end Behavioral;
