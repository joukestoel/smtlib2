

(define-fun increment ((curCounter Int) (nextCounter Int) (val Int)) Bool
	(and 
		(= val 1)
		(= nextCounter (+ curCounter val))
	)
)

(define-fun decrement ((curCounter Int) (nextCounter Int) (val Int)) Bool
	(and 
		(= val 1)
		(= nextCounter (- curCounter val))
	)
)

(define-fun transitionCondition ((curCounter Int) (nextCounter Int) (val Int)) Bool
	(or
		(increment curCounter nextCounter val)
		(decrement curCounter nextCounter val)
	)
)

(define-fun safetyCondition ((counter Int)) Bool
	(and 
		(< counter 25)
		(> counter (- 25))
	)
)

(define-fun initialCondition ((counter Int)) Bool
	(= counter 0)
)

(declare-const state_0_counter Int)
(declare-const state_1_counter Int)
(declare-const state_2_counter Int)
(declare-const state_3_counter Int)
(declare-const state_4_counter Int)
(declare-const state_5_counter Int)
(declare-const state_6_counter Int)
(declare-const state_7_counter Int)
(declare-const state_8_counter Int)
(declare-const state_9_counter Int)
(declare-const state_10_counter Int)
(declare-const state_11_counter Int)
(declare-const state_12_counter Int)
(declare-const state_13_counter Int)
(declare-const state_14_counter Int)
(declare-const state_15_counter Int)
(declare-const state_16_counter Int)
(declare-const state_17_counter Int)
(declare-const state_18_counter Int)
(declare-const state_19_counter Int)
(declare-const state_20_counter Int)
(declare-const state_21_counter Int)
(declare-const state_22_counter Int)
(declare-const state_23_counter Int)
(declare-const state_24_counter Int)
(declare-const state_25_counter Int)

(declare-const trans_0_param Int)
(declare-const trans_1_param Int)
(declare-const trans_2_param Int)
(declare-const trans_3_param Int)
(declare-const trans_4_param Int)
(declare-const trans_5_param Int)
(declare-const trans_6_param Int)
(declare-const trans_7_param Int)
(declare-const trans_8_param Int)
(declare-const trans_9_param Int)
(declare-const trans_10_param Int)
(declare-const trans_11_param Int)
(declare-const trans_12_param Int)
(declare-const trans_13_param Int)
(declare-const trans_14_param Int)
(declare-const trans_15_param Int)
(declare-const trans_16_param Int)
(declare-const trans_17_param Int)
(declare-const trans_18_param Int)
(declare-const trans_19_param Int)
(declare-const trans_20_param Int)
(declare-const trans_21_param Int)
(declare-const trans_22_param Int)
(declare-const trans_23_param Int)
(declare-const trans_24_param Int)

(assert (initialCondition state_0_counter))
(assert (transitionCondition state_0_counter state_1_counter trans_0_param))
(assert (transitionCondition state_1_counter state_2_counter trans_1_param))
(assert (transitionCondition state_2_counter state_3_counter trans_2_param))
(assert (transitionCondition state_3_counter state_4_counter trans_3_param))
(assert (transitionCondition state_4_counter state_5_counter trans_4_param))
(assert (transitionCondition state_5_counter state_6_counter trans_5_param))
(assert (transitionCondition state_6_counter state_7_counter trans_6_param))
(assert (transitionCondition state_7_counter state_8_counter trans_7_param))
(assert (transitionCondition state_8_counter state_9_counter trans_8_param))
(assert (transitionCondition state_9_counter state_10_counter trans_9_param))
(assert (transitionCondition state_10_counter state_11_counter trans_10_param))
(assert (transitionCondition state_11_counter state_12_counter trans_11_param))
(assert (transitionCondition state_12_counter state_13_counter trans_12_param))
(assert (transitionCondition state_13_counter state_14_counter trans_13_param))
(assert (transitionCondition state_14_counter state_15_counter trans_14_param))
(assert (transitionCondition state_15_counter state_16_counter trans_15_param))
(assert (transitionCondition state_16_counter state_17_counter trans_16_param))
(assert (transitionCondition state_17_counter state_18_counter trans_17_param))
(assert (transitionCondition state_18_counter state_19_counter trans_18_param))
(assert (transitionCondition state_19_counter state_20_counter trans_19_param))
(assert (transitionCondition state_20_counter state_21_counter trans_20_param))
(assert (transitionCondition state_21_counter state_22_counter trans_21_param))
(assert (transitionCondition state_22_counter state_23_counter trans_22_param))
(assert (transitionCondition state_23_counter state_24_counter trans_23_param))
(assert (transitionCondition state_24_counter state_25_counter trans_24_param))

(assert (safetyCondition state_0_counter))
(assert (safetyCondition state_1_counter))
(assert (safetyCondition state_2_counter))
(assert (safetyCondition state_3_counter))
(assert (safetyCondition state_4_counter))
(assert (safetyCondition state_5_counter))
(assert (safetyCondition state_6_counter))
(assert (safetyCondition state_7_counter))
(assert (safetyCondition state_8_counter))
(assert (safetyCondition state_9_counter))
(assert (safetyCondition state_10_counter))
(assert (safetyCondition state_11_counter))
(assert (safetyCondition state_12_counter))
(assert (safetyCondition state_13_counter))
(assert (safetyCondition state_14_counter))
(assert (safetyCondition state_15_counter))
(assert (safetyCondition state_16_counter))
(assert (safetyCondition state_17_counter))
(assert (safetyCondition state_18_counter))
(assert (safetyCondition state_19_counter))
(assert (safetyCondition state_20_counter))
(assert (safetyCondition state_21_counter))
(assert (safetyCondition state_22_counter))
(assert (safetyCondition state_23_counter))
(assert (safetyCondition state_24_counter))
(assert (not (safetyCondition state_25_counter)))

(check-sat)
(get-model)

