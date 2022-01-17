{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Parser where

import Lexer
import Syntax

import Control.Monad.Except
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t7
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 (Stmt)
	| HappyAbsSyn5 ([Term])
	| HappyAbsSyn6 (Lamexpr)
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 (Factor)
	| HappyAbsSyn9 (Lit)

happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x04\x3f\x00\x08\x40\x00\x00\x80\xe0\x07\x00\x01\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x80\x07\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x0f\x00\x02\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x3f\x00\x08\x40\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x01\x00\x3c\x00\x00\x00\x00\x20\x00\xc0\x07\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x7e\x00\x10\x80\x00\x00\x00\xc0\x0f\x00\x02\x10\x00\x00\x00\xf8\x01\x40\x00\x02\x00\x00\x00\x3f\x00\x08\x40\x00\x00\x00\xe0\x07\x00\x01\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\x00\x18\x00\x00\x00\x00\x00\x00\xc0\x03\x00\x20\xf8\x01\x40\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfc\x00\x20\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\xf0\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_hackp","Stmt","Terms","Lamx","Term","Factor","Id","enum","import","begin","end","if","then","else","and","or","lam","cons","fst","rst","let","main","true","false","intlit","floatlit","charlit","strlit","float","int","char","str","list","'&&'","'||'","'=>'","'=='","'->'","'<-'","'::'","'..'","ident","'.'","','","';'","':'","'='","'|'","'['","']'","'{'","'}'","'('","')'","'+'","'-'","'*'","'/'","%eof"]
        bit_start = st Prelude.* 61
        bit_end = (st Prelude.+ 1) Prelude.* 61
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..60]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (19#) = happyShift action_6
action_0 (25#) = happyShift action_7
action_0 (26#) = happyShift action_8
action_0 (27#) = happyShift action_9
action_0 (28#) = happyShift action_10
action_0 (29#) = happyShift action_11
action_0 (30#) = happyShift action_12
action_0 (44#) = happyShift action_13
action_0 (55#) = happyShift action_16
action_0 (4#) = happyGoto action_15
action_0 (6#) = happyGoto action_2
action_0 (7#) = happyGoto action_3
action_0 (8#) = happyGoto action_4
action_0 (9#) = happyGoto action_5
action_0 x = happyTcHack x happyFail (happyExpListPerState 0)

action_1 (19#) = happyShift action_6
action_1 (25#) = happyShift action_7
action_1 (26#) = happyShift action_8
action_1 (27#) = happyShift action_9
action_1 (28#) = happyShift action_10
action_1 (29#) = happyShift action_11
action_1 (30#) = happyShift action_12
action_1 (44#) = happyShift action_13
action_1 (55#) = happyShift action_14
action_1 (6#) = happyGoto action_2
action_1 (7#) = happyGoto action_3
action_1 (8#) = happyGoto action_4
action_1 (9#) = happyGoto action_5
action_1 x = happyTcHack x happyFail (happyExpListPerState 1)

action_2 x = happyTcHack x happyReduce_1

action_3 (39#) = happyShift action_21
action_3 (57#) = happyShift action_22
action_3 (58#) = happyShift action_23
action_3 (59#) = happyShift action_24
action_3 (60#) = happyShift action_25
action_3 x = happyTcHack x happyReduce_6

action_4 x = happyTcHack x happyReduce_12

action_5 x = happyTcHack x happyReduce_14

action_6 (44#) = happyShift action_20
action_6 x = happyTcHack x happyFail (happyExpListPerState 6)

action_7 x = happyTcHack x happyReduce_20

action_8 x = happyTcHack x happyReduce_21

action_9 x = happyTcHack x happyReduce_16

action_10 x = happyTcHack x happyReduce_17

action_11 x = happyTcHack x happyReduce_18

action_12 x = happyTcHack x happyReduce_19

action_13 x = happyTcHack x happyReduce_15

action_14 (25#) = happyShift action_7
action_14 (26#) = happyShift action_8
action_14 (27#) = happyShift action_9
action_14 (28#) = happyShift action_10
action_14 (29#) = happyShift action_11
action_14 (30#) = happyShift action_12
action_14 (44#) = happyShift action_13
action_14 (55#) = happyShift action_14
action_14 (7#) = happyGoto action_19
action_14 (8#) = happyGoto action_4
action_14 (9#) = happyGoto action_5
action_14 x = happyTcHack x happyFail (happyExpListPerState 14)

action_15 (61#) = happyAccept
action_15 x = happyTcHack x happyFail (happyExpListPerState 15)

action_16 (19#) = happyShift action_6
action_16 (25#) = happyShift action_7
action_16 (26#) = happyShift action_8
action_16 (27#) = happyShift action_9
action_16 (28#) = happyShift action_10
action_16 (29#) = happyShift action_11
action_16 (30#) = happyShift action_12
action_16 (44#) = happyShift action_13
action_16 (55#) = happyShift action_14
action_16 (6#) = happyGoto action_17
action_16 (7#) = happyGoto action_18
action_16 (8#) = happyGoto action_4
action_16 (9#) = happyGoto action_5
action_16 x = happyTcHack x happyFail (happyExpListPerState 16)

action_17 (56#) = happyShift action_33
action_17 x = happyTcHack x happyFail (happyExpListPerState 17)

action_18 (39#) = happyShift action_21
action_18 (56#) = happyShift action_32
action_18 (57#) = happyShift action_22
action_18 (58#) = happyShift action_23
action_18 (59#) = happyShift action_24
action_18 (60#) = happyShift action_25
action_18 x = happyTcHack x happyFail (happyExpListPerState 18)

action_19 (39#) = happyShift action_21
action_19 (56#) = happyShift action_32
action_19 (57#) = happyShift action_22
action_19 (58#) = happyShift action_23
action_19 (59#) = happyShift action_24
action_19 (60#) = happyShift action_25
action_19 x = happyTcHack x happyFail (happyExpListPerState 19)

action_20 (43#) = happyShift action_31
action_20 x = happyTcHack x happyFail (happyExpListPerState 20)

action_21 (25#) = happyShift action_7
action_21 (26#) = happyShift action_8
action_21 (27#) = happyShift action_9
action_21 (28#) = happyShift action_10
action_21 (29#) = happyShift action_11
action_21 (30#) = happyShift action_12
action_21 (44#) = happyShift action_13
action_21 (55#) = happyShift action_14
action_21 (7#) = happyGoto action_30
action_21 (8#) = happyGoto action_4
action_21 (9#) = happyGoto action_5
action_21 x = happyTcHack x happyFail (happyExpListPerState 21)

action_22 (25#) = happyShift action_7
action_22 (26#) = happyShift action_8
action_22 (27#) = happyShift action_9
action_22 (28#) = happyShift action_10
action_22 (29#) = happyShift action_11
action_22 (30#) = happyShift action_12
action_22 (44#) = happyShift action_13
action_22 (55#) = happyShift action_14
action_22 (7#) = happyGoto action_29
action_22 (8#) = happyGoto action_4
action_22 (9#) = happyGoto action_5
action_22 x = happyTcHack x happyFail (happyExpListPerState 22)

action_23 (25#) = happyShift action_7
action_23 (26#) = happyShift action_8
action_23 (27#) = happyShift action_9
action_23 (28#) = happyShift action_10
action_23 (29#) = happyShift action_11
action_23 (30#) = happyShift action_12
action_23 (44#) = happyShift action_13
action_23 (55#) = happyShift action_14
action_23 (7#) = happyGoto action_28
action_23 (8#) = happyGoto action_4
action_23 (9#) = happyGoto action_5
action_23 x = happyTcHack x happyFail (happyExpListPerState 23)

action_24 (25#) = happyShift action_7
action_24 (26#) = happyShift action_8
action_24 (27#) = happyShift action_9
action_24 (28#) = happyShift action_10
action_24 (29#) = happyShift action_11
action_24 (30#) = happyShift action_12
action_24 (44#) = happyShift action_13
action_24 (55#) = happyShift action_14
action_24 (7#) = happyGoto action_27
action_24 (8#) = happyGoto action_4
action_24 (9#) = happyGoto action_5
action_24 x = happyTcHack x happyFail (happyExpListPerState 24)

action_25 (25#) = happyShift action_7
action_25 (26#) = happyShift action_8
action_25 (27#) = happyShift action_9
action_25 (28#) = happyShift action_10
action_25 (29#) = happyShift action_11
action_25 (30#) = happyShift action_12
action_25 (44#) = happyShift action_13
action_25 (55#) = happyShift action_14
action_25 (7#) = happyGoto action_26
action_25 (8#) = happyGoto action_4
action_25 (9#) = happyGoto action_5
action_25 x = happyTcHack x happyFail (happyExpListPerState 25)

action_26 x = happyTcHack x happyReduce_10

action_27 x = happyTcHack x happyReduce_9

action_28 (59#) = happyShift action_24
action_28 (60#) = happyShift action_25
action_28 x = happyTcHack x happyReduce_8

action_29 (59#) = happyShift action_24
action_29 (60#) = happyShift action_25
action_29 x = happyTcHack x happyReduce_7

action_30 (57#) = happyShift action_22
action_30 (58#) = happyShift action_23
action_30 (59#) = happyShift action_24
action_30 (60#) = happyShift action_25
action_30 x = happyTcHack x happyReduce_11

action_31 (19#) = happyShift action_6
action_31 (25#) = happyShift action_7
action_31 (26#) = happyShift action_8
action_31 (27#) = happyShift action_9
action_31 (28#) = happyShift action_10
action_31 (29#) = happyShift action_11
action_31 (30#) = happyShift action_12
action_31 (44#) = happyShift action_13
action_31 (55#) = happyShift action_14
action_31 (6#) = happyGoto action_35
action_31 (7#) = happyGoto action_3
action_31 (8#) = happyGoto action_4
action_31 (9#) = happyGoto action_5
action_31 x = happyTcHack x happyFail (happyExpListPerState 31)

action_32 x = happyTcHack x happyReduce_13

action_33 (5#) = happyGoto action_34
action_33 x = happyTcHack x happyReduce_4

action_34 (25#) = happyShift action_7
action_34 (26#) = happyShift action_8
action_34 (27#) = happyShift action_9
action_34 (28#) = happyShift action_10
action_34 (29#) = happyShift action_11
action_34 (30#) = happyShift action_12
action_34 (44#) = happyShift action_13
action_34 (55#) = happyShift action_14
action_34 (7#) = happyGoto action_36
action_34 (8#) = happyGoto action_4
action_34 (9#) = happyGoto action_5
action_34 x = happyTcHack x happyReduce_2

action_35 x = happyTcHack x happyReduce_5

action_36 (39#) = happyShift action_21
action_36 (57#) = happyShift action_22
action_36 (58#) = happyShift action_23
action_36 (59#) = happyShift action_24
action_36 (60#) = happyShift action_25
action_36 x = happyTcHack x happyReduce_3

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_1 = happySpecReduce_1  4# happyReduction_1
happyReduction_1 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (Lamexpr happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_2 = happyReduce 4# 4# happyReduction_2
happyReduction_2 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Eval happy_var_2 happy_var_4
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_3 = happySpecReduce_2  5# happyReduction_3
happyReduction_3 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_2:happy_var_1
	)
happyReduction_3 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_4 = happySpecReduce_0  5# happyReduction_4
happyReduction_4  =  HappyAbsSyn5
		 ([]
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_5 = happyReduce 4# 6# happyReduction_5
happyReduction_5 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (SLamexpr happy_var_2 happy_var_4
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_6 = happySpecReduce_1  6# happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (Expr happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_7 = happySpecReduce_3  7# happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Op Add happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_8 = happySpecReduce_3  7# happyReduction_8
happyReduction_8 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Op Sub happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_9 = happySpecReduce_3  7# happyReduction_9
happyReduction_9 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Op Mul happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_10 = happySpecReduce_3  7# happyReduction_10
happyReduction_10 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Op Div happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_11 = happySpecReduce_3  7# happyReduction_11
happyReduction_11 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Op Eql happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_12 = happySpecReduce_1  7# happyReduction_12
happyReduction_12 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (Factor happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_13 = happySpecReduce_3  8# happyReduction_13
happyReduction_13 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (Brack happy_var_2
	)
happyReduction_13 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_14 = happySpecReduce_1  8# happyReduction_14
happyReduction_14 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (Lit happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_15 = happySpecReduce_1  9# happyReduction_15
happyReduction_15 (HappyTerminal (TokVar happy_var_1))
	 =  HappyAbsSyn9
		 (Var happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_16 = happySpecReduce_1  9# happyReduction_16
happyReduction_16 (HappyTerminal (TokIntLit happy_var_1))
	 =  HappyAbsSyn9
		 (LInt happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_17 = happySpecReduce_1  9# happyReduction_17
happyReduction_17 (HappyTerminal (TokFloatLit happy_var_1))
	 =  HappyAbsSyn9
		 (LFloat happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_18 = happySpecReduce_1  9# happyReduction_18
happyReduction_18 (HappyTerminal (TokCharLit happy_var_1))
	 =  HappyAbsSyn9
		 (LChar happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_19 = happySpecReduce_1  9# happyReduction_19
happyReduction_19 (HappyTerminal (TokStrLit happy_var_1))
	 =  HappyAbsSyn9
		 (LStr happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_20 = happySpecReduce_1  9# happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn9
		 (LBool True
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_21 = happySpecReduce_1  9# happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn9
		 (LBool False
	)

happyNewToken action sts stk [] =
	action 61# 61# notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokEnum -> cont 10#;
	TokImport -> cont 11#;
	TokBegin -> cont 12#;
	TokEnd -> cont 13#;
	TokIf -> cont 14#;
	TokThen -> cont 15#;
	TokElse -> cont 16#;
	TokAnd -> cont 17#;
	TokOr -> cont 18#;
	TokLam -> cont 19#;
	TokCons -> cont 20#;
	TokFst -> cont 21#;
	TokRst -> cont 22#;
	TokLet -> cont 23#;
	TokMain -> cont 24#;
	TokTTrue -> cont 25#;
	TokTFalse -> cont 26#;
	TokIntLit happy_dollar_dollar -> cont 27#;
	TokFloatLit happy_dollar_dollar -> cont 28#;
	TokCharLit happy_dollar_dollar -> cont 29#;
	TokStrLit happy_dollar_dollar -> cont 30#;
	TokFloatType -> cont 31#;
	TokIntType -> cont 32#;
	TokCharType -> cont 33#;
	TokStrType -> cont 34#;
	TokList -> cont 35#;
	TokLand -> cont 36#;
	TokLor -> cont 37#;
	TokImpl -> cont 38#;
	TokIsEq -> cont 39#;
	TokArrow -> cont 40#;
	TokBackarr -> cont 41#;
	TokNms -> cont 42#;
	TokBullet -> cont 43#;
	TokVar happy_dollar_dollar -> cont 44#;
	TokDot -> cont 45#;
	TokComma -> cont 46#;
	TokSemi -> cont 47#;
	TokCol -> cont 48#;
	TokEqs -> cont 49#;
	TokPipe -> cont 50#;
	TokLBrack -> cont 51#;
	TokRBrack -> cont 52#;
	TokLBrace -> cont 53#;
	TokRBrace -> cont 54#;
	TokLParen -> cont 55#;
	TokRParen -> cont 56#;
	TokPlus -> cont 57#;
	TokMinus -> cont 58#;
	TokTimes -> cont 59#;
	TokDivide -> cont 60#;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 61# tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Except String a -> (a -> Except String b) -> Except String b
happyThen = ((>>=))
happyReturn :: () => a -> Except String a
happyReturn = (return)
happyThen1 m k tks = ((>>=)) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Except String a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> Except String a
happyError' = (\(tokens, _) -> parseError tokens)
hackp tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


-- COMES FROM THE EXAMPLES ONLINE... 
-- I think this is literally from Happy documentation

parseError :: [Token] -> Except String a
parseError (l:ls) = throwError (show l)
parseError [] = throwError "Unexpected end of Input"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Prelude.Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Prelude.Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Prelude.Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif



















data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 1# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j ) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

































indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `Prelude.mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Happy_GHC_Exts.Int# ->                    -- token number
         Happy_GHC_Exts.Int# ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 1# tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Happy_GHC_Exts.Int#
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n ((_):(t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 1# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action 1# 1# tk (HappyState (action)) sts ((HappyErrorToken (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
