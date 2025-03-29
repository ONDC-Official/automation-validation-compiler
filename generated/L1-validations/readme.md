

- **search** : All the following sub conditions must pass as per the api requirement

	- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
	  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload
	
	- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
	  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["search"]
	
	- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TYPE_12**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TYPE_12.1**: $.message.intent.fulfillment.stops[*].type must be present in the payload
	  - **condition REQUIRED_MESSAGE_TYPE_12.2**: every element of $.message.intent.fulfillment.stops[*].type must be in ["START", "END", "INTERMEDIATE_STOP"]
	
	- **condition REQUIRED_MESSAGE_GPS_13**: $.message.intent.fulfillment.stops[*].location.gps must be present in the payload
	
	- **condition REQUIRED_MESSAGE_COLLECTED_BY_14**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_14.1**: $.message.intent.payment.collected_by must be present in the payload
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_14.2**: every element of $.message.intent.payment.collected_by must be in ["BPP", "BAP"]
	
	- **condition VALID_ENUM_MESSAGE_CODE_1**: every element of $.message.intent.category.descriptor.code must be in ["ON_DEMAND_TRIP", "ON_DEMAND_RENTAL", "SCHEDULED_TRIP", "SCHEDULED_RENTAL"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CODE_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.category.descriptor.code must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_CATEGORY_2**: every element of $.message.intent.fulfillment.vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CATEGORY_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.fulfillment.vehicle.category must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_VARIANT_3**: every element of $.message.intent.fulfillment.vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_VARIANT_3** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.fulfillment.vehicle.variant must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_ENERGY_TYPE_4**: every element of $.message.intent.fulfillment.vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_ENERGY_TYPE_4** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.fulfillment.vehicle.energy_type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_5**: every element of $.message.intent.fulfillment.type must be in ["DELIVERY", "SELF_PICKUP"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_5** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.fulfillment.type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_6**: every element of $.message.intent.fulfillment.stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_6** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.fulfillment.stops[*].authorization.type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_7**: every element of $.message.intent.fulfillment.stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_7** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.fulfillment.stops[*].authorization.status must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_CODE_8**: every element of $.message.intent.fulfillment.state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CODE_8** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.fulfillment.state.descriptor.code must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_9**: every element of $.message.intent.payment.status must be in ["NOT-PAID", "PAID"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_9** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.payment.status must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_10**: every element of $.message.intent.payment.type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_10** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.payment.type must **not** be present in the payload
	
	- **condition validate_tag_0**: every element of $.message.intent.tags[*].descriptor.code must be in ["BAP_TERMS"]
	
		> Note: **Condition validate_tag_0** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_0_BAP_TERMS**: every element of $.message.intent.tags[?(@.descriptor.code=='BAP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT", "SETTLEMENT_BANK_CODE", "SETTLEMENT_BANK_ACCOUNT_NUMBER", "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS"]
	
	- **condition validate_tag_1**: every element of $.message.intent.item.tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS"]
	
		> Note: **Condition validate_tag_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.item.tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_1_DISABILITY_VIS**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_HEA**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_MOB**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_LEP**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_SPE**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_INTEL**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_MENTAL**: every element of $.message.intent.item.tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_BLOOD**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_DWARFISM**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_ACID_ATTACK_SURVIVOR**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_MULTIPLE_DIS**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]

- **select** : All the following sub conditions must pass as per the api requirement

	- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
	  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload
	
	- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
	  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["select"]
	
	- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_ID_12**: $.context.bpp_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_URI_13**: $.context.bpp_uri must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_14**: $.message.order.items[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_15**: $.message.order.provider.id must be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_CODE_1**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CODE_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.items[*].descriptor.code must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_CATEGORY_2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CATEGORY_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.category must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_VARIANT_3**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_VARIANT_3** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_ENERGY_TYPE_4**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_ENERGY_TYPE_4** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_5**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_5** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_6**: every element of $.message.order.fulfillments[*].type must be in ["START", "END", "INTERMEDIATE_STOP"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_6** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_7**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_7** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_8**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_8** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_CODE_9**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CODE_9** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].state.descriptor.code must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_10**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_10** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.payments[*].status must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_COLLECTED_BY_11**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_COLLECTED_BY_11** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.payments[*].collected_by must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_12**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_12** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.payments[*].type must **not** be present in the payload

- **init** : All the following sub conditions must pass as per the api requirement

	- **condition FULFILLMENT_STATE_ENDED**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_ENDED"]
	
		> Note: **Condition FULFILLMENT_STATE_ENDED** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of ["CLAIMED"] must **not** be in $.message.order.fulfillments[*].stops[*].authorization.status
	
	- **condition PAYMENT_STATUS_TRANSACTION_ID**: $.message.order.payments[*].params.transaction_id must be present in the payload
	
		> Note: **Condition PAYMENT_STATUS_TRANSACTION_ID** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]
	
	- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
	  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload
	
	- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
	  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["init"]
	
	- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_ID_12**: $.context.bpp_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_URI_13**: $.context.bpp_uri must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_14**: $.message.order.items[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_15**: $.message.order.provider.id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_16**: $.message.order.billing.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_17**: $.message.order.fulfillments[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_18**: $.message.order.fulfillments[*].customer.person.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_PHONE_19**: $.message.order.fulfillments[*].customer.contact.phone must be present in the payload
	
	- **condition REQUIRED_MESSAGE_GPS_21**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CATEGORY_22**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CATEGORY_22.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
	  - **condition REQUIRED_MESSAGE_CATEGORY_22.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
	- **condition REQUIRED_MESSAGE_COLLECTED_BY_23**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_23.1**: $.message.order.payments[*].collected_by must be present in the payload
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_23.2**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
	
	- **condition REQUIRED_MESSAGE_STATUS_24**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_STATUS_24.1**: $.message.order.payments[*].status must be present in the payload
	  - **condition REQUIRED_MESSAGE_STATUS_24.2**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
	
	- **condition REQUIRED_MESSAGE_TYPE_25**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TYPE_25.1**: $.message.order.payments[*].type must be present in the payload
	  - **condition REQUIRED_MESSAGE_TYPE_25.2**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
	- **condition VALID_ENUM_MESSAGE_CODE_1**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CODE_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.items[*].descriptor.code must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_VARIANT_2**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_VARIANT_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_ENERGY_TYPE_3**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_ENERGY_TYPE_3** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_4**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_4** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_5**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_5** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_CODE_6**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CODE_6** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].state.descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_0**: every element of $.message.order.tags[*].descriptor.code must be in ["BAP_TERMS"]
	
		> Note: **Condition validate_tag_0** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_0_BAP_TERMS**: every element of $.message.order.tags[?(@.descriptor.code=='BAP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT", "SETTLEMENT_BANK_CODE", "SETTLEMENT_BANK_ACCOUNT_NUMBER", "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS"]

- **confirm** : All the following sub conditions must pass as per the api requirement

	- **condition PAYMENT_STATUS_TRANSACTION_ID**: $.message.order.payments[*].params.transaction_id must be present in the payload
	
		> Note: **Condition PAYMENT_STATUS_TRANSACTION_ID** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]
	
	- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
	  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload
	
	- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
	  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["confirm"]
	
	- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_ID_12**: $.context.bpp_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_URI_13**: $.context.bpp_uri must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_14**: $.message.order.items[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_15**: $.message.order.provider.id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_16**: $.message.order.billing.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_17**: $.message.order.payments[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_COLLECTED_BY_18**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_18.1**: $.message.order.payments[*].collected_by must be present in the payload
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_18.2**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
	
	- **condition REQUIRED_MESSAGE_STATUS_19**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_STATUS_19.1**: $.message.order.payments[*].status must be present in the payload
	  - **condition REQUIRED_MESSAGE_STATUS_19.2**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
	
	- **condition REQUIRED_MESSAGE_TYPE_20**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TYPE_20.1**: $.message.order.payments[*].type must be present in the payload
	  - **condition REQUIRED_MESSAGE_TYPE_20.2**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
	- **condition REQUIRED_MESSAGE_ID_24**: $.message.order.fulfillments[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_25**: $.message.order.fulfillments[*].customer.person.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_PHONE_26**: $.message.order.fulfillments[*].customer.contact.phone must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TYPE_27**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TYPE_27.1**: $.message.order.fulfillments[*].type must be present in the payload
	  - **condition REQUIRED_MESSAGE_TYPE_27.2**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
	
	- **condition REQUIRED_MESSAGE_GPS_28**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CATEGORY_29**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CATEGORY_29.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
	  - **condition REQUIRED_MESSAGE_CATEGORY_29.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
	- **condition VALID_ENUM_MESSAGE_CODE_1**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CODE_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.items[*].descriptor.code must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_VARIANT_2**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_VARIANT_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_ENERGY_TYPE_3**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_ENERGY_TYPE_3** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_4**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_4** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_5**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_5** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_CODE_6**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CODE_6** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].state.descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_0**: every element of $.message.order.tags[*].descriptor.code must be in ["BAP_TERMS", "BPP_TERMS"]
	
		> Note: **Condition validate_tag_0** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_0_BAP_TERMS**: every element of $.message.order.tags[?(@.descriptor.code=='BAP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT", "SETTLEMENT_BANK_CODE", "SETTLEMENT_BANK_ACCOUNT_NUMBER", "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS"]
	
	- **condition validate_tag_0_BPP_TERMS**: every element of $.message.order.tags[?(@.descriptor.code=='BPP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT"]
	
	- **condition validate_tag_1**: every element of $.message.order.items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO"]
	
		> Note: **Condition validate_tag_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.items[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_1_DISABILITY_VIS**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT", "FEATURE_LIST"]
	
	- **condition validate_tag_1_DISABILITY_HEA**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_MOB**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_LEP**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_SPE**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_INTEL**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_MENTAL**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_BLOOD**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_DWARFISM**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_ACID_ATTACK_SURVIVOR**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_MULTIPLE_DIS**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_FARE_POLICY**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]
	
	- **condition validate_tag_1_INFO**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOURS", "TOTAL_DISTANCE"]
	
	- **condition validate_tag_2**: every element of $.message.order.fulfillments[*].tags[*].descriptor.code must be in ["ROUTE_INFO"]
	
		> Note: **Condition validate_tag_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_2_ROUTE_INFO**: every element of $.message.order.fulfillments[*].tags[?(@.descriptor.code=='ROUTE_INFO')].list[*].descriptor.code must be in ["ENCODED_POLYLINE", "WAYPOINTS"]

- **status** : All the following sub conditions must pass as per the api requirement

	- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
	  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload
	
	- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
	  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["status"]
	
	- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_ID_12**: $.context.bpp_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_URI_13**: $.context.bpp_uri must be present in the payload

- **cancel** : All the following sub conditions must pass as per the api requirement

	- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
	  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload
	
	- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
	  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["cancel"]
	
	- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_ID_12**: $.context.bpp_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_URI_13**: $.context.bpp_uri must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ORDER_ID_14**: $.message.order_id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CANCELLATION_REASON_ID_15**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CANCELLATION_REASON_ID_15.1**: $.message.cancellation_reason_id must be present in the payload
	  - **condition REQUIRED_MESSAGE_CANCELLATION_REASON_ID_15.2**: every element of $.message.cancellation_reason_id must be in ["000", "001", "002", "003", "004", "005", "011", "012", "013", "014"]
	
	- **condition REQUIRED_MESSAGE_CODE_16**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CODE_16.1**: $.message.descriptor.code must be present in the payload
	  - **condition REQUIRED_MESSAGE_CODE_16.2**: every element of $.message.descriptor.code must be in ["SOFT_CANCEL", "CONFIRM_CANCEL", "ACTIVE", "COMPLETE", "CANCELLED", "UPDATED", "CONFIRM_UPDATE"]

- **update** : All the following sub conditions must pass as per the api requirement

	- **condition FULFILLMENT_STATE_ENDED**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_ENDED", "RIDE_STARTED"]
	
		> Note: **Condition FULFILLMENT_STATE_ENDED** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of ["CLAIMED"] must **not** be in $.message.order.fulfillments[*].stops[*].authorization.status
	
	- **condition PAYMENT_STATUS_TRANSACTION_ID**: $.message.order.payments[*].params.transaction_id must be present in the payload
	
		> Note: **Condition PAYMENT_STATUS_TRANSACTION_ID** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]
	
	- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
	  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload
	
	- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
	  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["update"]
	
	- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_ID_12**: $.context.bpp_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_URI_13**: $.context.bpp_uri must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_14**: $.message.order.id must be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_CODE_1**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CODE_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.items[*].descriptor.code must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_CATEGORY_2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CATEGORY_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.category must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_VARIANT_3**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_VARIANT_3** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_ENERGY_TYPE_4**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_ENERGY_TYPE_4** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_5**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_5** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_6**: every element of $.message.order.fulfillments[*].type must be in ["START", "END", "INTERMEDIATE_STOP"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_6** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_7**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_7** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_8**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_8** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_CODE_9**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CODE_9** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].state.descriptor.code must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_10**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_10** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.payments[*].status must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_COLLECTED_BY_11**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_COLLECTED_BY_11** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.payments[*].collected_by must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_12**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_12** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.payments[*].type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TITLE_13**: every element of $.message.order.quote.breakup[*].title must be in ["BASE_FARE", "DISTANCE_FARE", "CANCELLATION_CHARGES", "REFUND", "TOLL_CHARGES", "PARKING_CHARGES", "TAX", "WAITING_CHARGES", "DRIVER_BATA", "NIGHT_CHARGES", "BUYER_ADDITIONAL_AMOUNT"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TITLE_13** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.quote.breakup[*].title must **not** be present in the payload

- **on_search** : All the following sub conditions must pass as per the api requirement

	- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
	  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload
	
	- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
	  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["on_search"]
	
	- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_ID_12**: $.context.bpp_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_URI_13**: $.context.bpp_uri must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_14**: $.message.catalog.descriptor.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_15**: $.message.catalog.providers[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_16**: $.message.catalog.providers[*].fulfillments[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TYPE_17**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TYPE_17.1**: $.message.catalog.providers[*].fulfillments[*].type must be present in the payload
	  - **condition REQUIRED_MESSAGE_TYPE_17.2**: every element of $.message.catalog.providers[*].fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
	
	- **condition REQUIRED_MESSAGE_TYPE_18**: $.message.catalog.providers[*].fulfillments[*].type must be present in the payload
	
	- **condition REQUIRED_MESSAGE_GPS_19**: $.message.catalog.providers[*].fulfillments[*].stops[*].location.gps must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CATEGORY_20**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CATEGORY_20.1**: $.message.catalog.providers[*].fulfillments[*].vehicle.category must be present in the payload
	  - **condition REQUIRED_MESSAGE_CATEGORY_20.2**: every element of $.message.catalog.providers[*].fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
	- **condition REQUIRED_MESSAGE_ID_21**: $.message.catalog.providers[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CODE_22**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CODE_22.1**: $.message.catalog.providers[*].items[*].descriptor.code must be present in the payload
	  - **condition REQUIRED_MESSAGE_CODE_22.2**: every element of $.message.catalog.providers[*].items[*].descriptor.code must be in ["RIDE", "RENTAL", "INTERMEDIATE_STOP"]
	
	- **condition REQUIRED_MESSAGE_CURRENCY_24**: $.message.catalog.providers[*].items[*].price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_VALUE_25**: $.message.catalog.providers[*].items[*].price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_FULFILLMENT_IDS_26**: $.message.catalog.providers[*].items[*].fulfillment_ids[*] must be present in the payload
	
	- **condition REQUIRED_MESSAGE_COLLECTED_BY_27**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_27.1**: $.message.catalog.providers[*].payments[*].collected_by must be present in the payload
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_27.2**: every element of $.message.catalog.providers[*].payments[*].collected_by must be in ["BPP", "BAP"]
	
	- **condition VALID_ENUM_MESSAGE_VARIANT_1**: every element of $.message.catalog.providers[*].fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_VARIANT_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.catalog.providers[*].fulfillments[*].vehicle.variant must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_ENERGY_TYPE_2**: every element of $.message.catalog.providers[*].fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_ENERGY_TYPE_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.catalog.providers[*].fulfillments[*].vehicle.energy_type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_3**: every element of $.message.catalog.providers[*].fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_3** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.catalog.providers[*].fulfillments[*].stops[*].authorization.type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_4**: every element of $.message.catalog.providers[*].fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_4** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.catalog.providers[*].fulfillments[*].stops[*].authorization.status must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_CODE_5**: every element of $.message.catalog.providers[*].fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CODE_5** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.catalog.providers[*].fulfillments[*].state.descriptor.code must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_6**: every element of $.message.catalog.providers[*].payments[*].status must be in ["NOT-PAID", "PAID"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_6** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.catalog.providers[*].payments[*].status must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_7**: every element of $.message.catalog.providers[*].payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_7** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.catalog.providers[*].payments[*].type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_CODE_8**: every element of $.message.catalog.providers[*].categories[*].descriptor.code must be in ["ON_DEMAND_TRIP", "ON_DEMAND_RENTAL", "SCHEDULED_TRIP", "SCHEDULED_RENTAL"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CODE_8** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.catalog.providers[*].categories[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_0**: every element of $.message.catalog.tags[*].descriptor.code must be in ["BPP_TERMS"]
	
		> Note: **Condition validate_tag_0** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.catalog.tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_0_BPP_TERMS**: every element of $.message.catalog.tags[?(@.descriptor.code=='BPP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT"]
	
	- **condition validate_tag_1**: every element of $.message.catalog.providers[*].items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO", "FEATURE_LIST"]
	
		> Note: **Condition validate_tag_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.catalog.providers[*].items[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_1_DISABILITY_VIS**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_HEA**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_MOB**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_LEP**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_SPE**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_INTEL**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_MENTAL**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_BLOOD**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_DWARFISM**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_ACID_ATTACK_SURVIVOR**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_MULTIPLE_DIS**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_FARE_POLICY**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]
	
	- **condition validate_tag_1_INFO**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOUR", "TOTAL_DISTANCE"]

- **on_select** : All the following sub conditions must pass as per the api requirement

	- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
	  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload
	
	- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
	  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["on_select"]
	
	- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_ID_12**: $.context.bpp_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_URI_13**: $.context.bpp_uri must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_14**: $.message.order.items[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_15**: $.message.order.items[*].descriptor.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CODE_16**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CODE_16.1**: $.message.order.items[*].descriptor.code must be present in the payload
	  - **condition REQUIRED_MESSAGE_CODE_16.2**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
	
	- **condition REQUIRED_MESSAGE_CURRENCY_17**: $.message.order.items[*].price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_VALUE_18**: $.message.order.items[*].price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_FULFILLMENT_IDS_19**: $.message.order.items[*].fulfillment_ids[*] must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_20**: $.message.order.provider.id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_21**: $.message.order.fulfillments[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TYPE_22**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TYPE_22.1**: $.message.order.fulfillments[*].type must be present in the payload
	  - **condition REQUIRED_MESSAGE_TYPE_22.2**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
	
	- **condition REQUIRED_MESSAGE_GPS_23**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CATEGORY_24**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CATEGORY_24.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
	  - **condition REQUIRED_MESSAGE_CATEGORY_24.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
	- **condition REQUIRED_MESSAGE_VALUE_25**: $.message.order.quote.price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CURRENCY_26**: $.message.order.quote.price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TITLE_27**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TITLE_27.1**: $.message.order.quote.breakup[*].title must be present in the payload
	  - **condition REQUIRED_MESSAGE_TITLE_27.2**: every element of $.message.order.quote.breakup[*].title must be in ["BASE_FARE", "DISTANCE_FARE", "CANCELLATION_CHARGES", "REFUND", "TOLL_CHARGES", "PARKING_CHARGES", "TAX", "WAITING_CHARGES", "DRIVER_BATA", "NIGHT_CHARGES", "BUYER_ADDITIONAL_AMOUNT"]
	
	- **condition REQUIRED_MESSAGE_VALUE_28**: $.message.order.quote.breakup[*].price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CURRENCY_29**: $.message.order.quote.breakup[*].price.currency must be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_VARIANT_1**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_VARIANT_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_ENERGY_TYPE_2**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_ENERGY_TYPE_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_3**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_3** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_4**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_4** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_CODE_5**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CODE_5** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].state.descriptor.code must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_6**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_6** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.payments[*].status must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_COLLECTED_BY_7**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_COLLECTED_BY_7** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.payments[*].collected_by must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_8**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_8** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.payments[*].type must **not** be present in the payload
	
	- **condition validate_tag_0**: every element of $.message.order.items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO", "FEATURE_LIST"]
	
		> Note: **Condition validate_tag_0** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.items[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_0_DISABILITY_VIS**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT", "FEATURE_LIST"]
	
	- **condition validate_tag_0_DISABILITY_HEA**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_0_DISABILITY_MOB**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_0_DISABILITY_LEP**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_0_DISABILITY_SPE**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_0_DISABILITY_INTEL**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_0_MENTAL**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_0_DISABILITY_BLOOD**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_0_DISABILITY_DWARFISM**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_0_DISABILITY_ACID_ATTACK_SURVIVOR**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_0_DISABILITY_MULTIPLE_DIS**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_0_FARE_POLICY**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]
	
	- **condition validate_tag_0_INFO**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOURS", "TOTAL_DISTANCE"]
	
	- **condition validate_tag_1**: every element of $.message.order.fulfillments[*].tags[*].descriptor.code must be in ["ROUTE_INFO"]
	
		> Note: **Condition validate_tag_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_1_ROUTE_INFO**: every element of $.message.order.fulfillments[*].tags[?(@.descriptor.code=='ROUTE_INFO')].list[*].descriptor.code must be in ["ENCODED_POLYLINE", "WAYPOINTS"]

- **on_init** : All the following sub conditions must pass as per the api requirement

	- **condition FULFILLMENT_STATE_ENDED**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_ENDED", "RIDE_STARTED"]
	
		> Note: **Condition FULFILLMENT_STATE_ENDED** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of ["CLAIMED"] must **not** be in $.message.order.fulfillments[*].stops[*].authorization.status
	
	- **condition PAYMENT_STATUS_TRANSACTION_ID**: $.message.order.payments[*].params.transaction_id must be present in the payload
	
		> Note: **Condition PAYMENT_STATUS_TRANSACTION_ID** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]
	
	- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
	  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload
	
	- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
	  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["on_init"]
	
	- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_ID_12**: $.context.bpp_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_URI_13**: $.context.bpp_uri must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_14**: $.message.order.items[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_15**: $.message.order.items[*].descriptor.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CODE_16**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CODE_16.1**: $.message.order.items[*].descriptor.code must be present in the payload
	  - **condition REQUIRED_MESSAGE_CODE_16.2**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
	
	- **condition REQUIRED_MESSAGE_CURRENCY_17**: $.message.order.items[*].price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_VALUE_18**: $.message.order.items[*].price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_FULFILLMENT_IDS_19**: $.message.order.items[*].fulfillment_ids[*] must be present in the payload
	
	- **condition REQUIRED_MESSAGE_PAYMENT_IDS_20**: $.message.order.items[*].payment_ids[*] must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_21**: $.message.order.provider.id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_22**: $.message.order.fulfillments[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TYPE_23**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TYPE_23.1**: $.message.order.fulfillments[*].type must be present in the payload
	  - **condition REQUIRED_MESSAGE_TYPE_23.2**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
	
	- **condition REQUIRED_MESSAGE_TYPE_24**: $.message.order.fulfillments[*].type must be present in the payload
	
	- **condition REQUIRED_MESSAGE_GPS_25**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CATEGORY_26**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CATEGORY_26.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
	  - **condition REQUIRED_MESSAGE_CATEGORY_26.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
	- **condition REQUIRED_MESSAGE_NAME_27**: $.message.order.fulfillments[*].customer.person.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_PHONE_28**: $.message.order.fulfillments[*].customer.contact.phone must be present in the payload
	
	- **condition REQUIRED_MESSAGE_VALUE_29**: $.message.order.quote.price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CURRENCY_30**: $.message.order.quote.price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TITLE_31**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TITLE_31.1**: $.message.order.quote.breakup[*].title must be present in the payload
	  - **condition REQUIRED_MESSAGE_TITLE_31.2**: every element of $.message.order.quote.breakup[*].title must be in ["BASE_FARE", "DISTANCE_FARE", "CANCELLATION_CHARGES", "REFUND", "TOLL_CHARGES", "PARKING_CHARGES", "TAX", "WAITING_CHARGES", "DRIVER_BATA", "NIGHT_CHARGES"]
	
	- **condition REQUIRED_MESSAGE_CURRENCY_32**: $.message.order.quote.breakup[*].price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_VALUE_33**: $.message.order.quote.breakup[*].price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_34**: $.message.order.payments[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_COLLECTED_BY_35**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_35.1**: $.message.order.payments[*].collected_by must be present in the payload
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_35.2**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
	
	- **condition REQUIRED_MESSAGE_STATUS_36**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_STATUS_36.1**: $.message.order.payments[*].status must be present in the payload
	  - **condition REQUIRED_MESSAGE_STATUS_36.2**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
	
	- **condition REQUIRED_MESSAGE_TYPE_37**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TYPE_37.1**: $.message.order.payments[*].type must be present in the payload
	  - **condition REQUIRED_MESSAGE_TYPE_37.2**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
	- **condition REQUIRED_MESSAGE_CODE_41**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CODE_41.1**: $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be present in the payload
	  - **condition REQUIRED_MESSAGE_CODE_41.2**: every element of $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
	- **condition REQUIRED_MESSAGE_REASON_REQUIRED_42**: $.message.order.cancellation_terms[*].reason_required must be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_VARIANT_1**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_VARIANT_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_ENERGY_TYPE_2**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_ENERGY_TYPE_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_3**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_3** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_4**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_4** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_CODE_5**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CODE_5** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].state.descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_0**: every element of $.message.order.tags[*].descriptor.code must be in ["BPP_TERMS"]
	
		> Note: **Condition validate_tag_0** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_0_BPP_TERMS**: every element of $.message.order.tags[?(@.descriptor.code=='BPP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT"]
	
	- **condition validate_tag_1**: every element of $.message.order.items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO", "FEATURE_LIST"]
	
		> Note: **Condition validate_tag_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.items[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_1_DISABILITY_VIS**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT", "FEATURE_LIST"]
	
	- **condition validate_tag_1_DISABILITY_HEA**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_MOB**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_LEP**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_SPE**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_INTEL**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_MENTAL**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_BLOOD**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_DWARFISM**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_ACID_ATTACK_SURVIVOR**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_MULTIPLE_DIS**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_FARE_POLICY**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]
	
	- **condition validate_tag_1_INFO**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOURS", "TOTAL_DISTANCE"]
	
	- **condition validate_tag_2**: every element of $.message.order.fulfillments[*].tags[*].descriptor.code must be in ["ROUTE_INFO"]
	
		> Note: **Condition validate_tag_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_2_ROUTE_INFO**: every element of $.message.order.fulfillments[*].tags[?(@.descriptor.code=='ROUTE_INFO')].list[*].descriptor.code must be in ["ENCODED_POLYLINE", "WAYPOINTS"]

- **on_confirm** : All the following sub conditions must pass as per the api requirement

	- **condition FULFILLMENT_STATE_ENDED**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_ENDED", "RIDE_STARTED"]
	
		> Note: **Condition FULFILLMENT_STATE_ENDED** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of ["CLAIMED"] must **not** be in $.message.order.fulfillments[*].stops[*].authorization.status
	
	- **condition PAYMENT_STATUS_TRANSACTION_ID**: $.message.order.payments[*].params.transaction_id must be present in the payload
	
		> Note: **Condition PAYMENT_STATUS_TRANSACTION_ID** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]
	
	- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
	  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload
	
	- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
	  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["on_confirm"]
	
	- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_ID_12**: $.context.bpp_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_URI_13**: $.context.bpp_uri must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_14**: $.message.order.items[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_15**: $.message.order.items[*].descriptor.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CODE_16**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CODE_16.1**: $.message.order.items[*].descriptor.code must be present in the payload
	  - **condition REQUIRED_MESSAGE_CODE_16.2**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
	
	- **condition REQUIRED_MESSAGE_CURRENCY_17**: $.message.order.items[*].price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_VALUE_18**: $.message.order.items[*].price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_FULFILLMENT_IDS_19**: $.message.order.items[*].fulfillment_ids[*] must be present in the payload
	
	- **condition REQUIRED_MESSAGE_PAYMENT_IDS_20**: $.message.order.items[*].payment_ids[*] must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_21**: $.message.order.provider.id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_22**: $.message.order.fulfillments[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TYPE_23**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TYPE_23.1**: $.message.order.fulfillments[*].type must be present in the payload
	  - **condition REQUIRED_MESSAGE_TYPE_23.2**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
	
	- **condition REQUIRED_MESSAGE_NAME_24**: $.message.order.fulfillments[*].customer.person.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_PHONE_25**: $.message.order.fulfillments[*].customer.contact.phone must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CODE_26**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CODE_26.1**: $.message.order.fulfillments[*].state.descriptor.code must be present in the payload
	  - **condition REQUIRED_MESSAGE_CODE_26.2**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
	- **condition REQUIRED_MESSAGE_TYPE_27**: $.message.order.fulfillments[*].type must be present in the payload
	
	- **condition REQUIRED_MESSAGE_GPS_28**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CATEGORY_29**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CATEGORY_29.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
	  - **condition REQUIRED_MESSAGE_CATEGORY_29.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
	- **condition REQUIRED_MESSAGE_VALUE_30**: $.message.order.quote.price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CURRENCY_31**: $.message.order.quote.price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TITLE_32**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TITLE_32.1**: $.message.order.quote.breakup[*].title must be present in the payload
	  - **condition REQUIRED_MESSAGE_TITLE_32.2**: every element of $.message.order.quote.breakup[*].title must be in ["BASE_FARE", "DISTANCE_FARE", "CANCELLATION_CHARGES", "REFUND", "TOLL_CHARGES", "PARKING_CHARGES", "TAX", "WAITING_CHARGES", "DRIVER_BATA", "NIGHT_CHARGES"]
	
	- **condition REQUIRED_MESSAGE_CURRENCY_33**: $.message.order.quote.breakup[*].price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_VALUE_34**: $.message.order.quote.breakup[*].price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_35**: $.message.order.payments[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_COLLECTED_BY_36**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_36.1**: $.message.order.payments[*].collected_by must be present in the payload
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_36.2**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
	
	- **condition REQUIRED_MESSAGE_STATUS_37**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_STATUS_37.1**: $.message.order.payments[*].status must be present in the payload
	  - **condition REQUIRED_MESSAGE_STATUS_37.2**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
	
	- **condition REQUIRED_MESSAGE_TYPE_38**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TYPE_38.1**: $.message.order.payments[*].type must be present in the payload
	  - **condition REQUIRED_MESSAGE_TYPE_38.2**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
	- **condition REQUIRED_MESSAGE_CODE_42**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CODE_42.1**: $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be present in the payload
	  - **condition REQUIRED_MESSAGE_CODE_42.2**: every element of $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
	- **condition REQUIRED_MESSAGE_REASON_REQUIRED_43**: $.message.order.cancellation_terms[*].reason_required must be present in the payload
	
	- **condition REQUIRED_MESSAGE_STATUS_44**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_STATUS_44.1**: $.message.order.status must be present in the payload
	  - **condition REQUIRED_MESSAGE_STATUS_44.2**: every element of $.message.order.status must be in ["UPDATED", "SOFT_CANCEL", "CONFIRM_CANCEL", "ACTIVE", "COMPLETE", "CANCELLED", "CONFIRM_UPDATE", "SOFT_UPDATE"]
	
	- **condition REQUIRED_MESSAGE_CREATED_AT_45**: $.message.order.created_at must be present in the payload
	
	- **condition REQUIRED_MESSAGE_UPDATED_AT_46**: $.message.order.updated_at must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_47**: $.message.order.id must be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_VARIANT_1**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_VARIANT_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_ENERGY_TYPE_2**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_ENERGY_TYPE_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_3**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_3** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_4**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_4** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
	
	- **condition validate_tag_0**: every element of $.message.order.tags[*].descriptor.code must be in ["BAP_TERMS", "BPP_TERMS"]
	
		> Note: **Condition validate_tag_0** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_0_BAP_TERMS**: every element of $.message.order.tags[?(@.descriptor.code=='BAP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT", "SETTLEMENT_BANK_CODE", "SETTLEMENT_BANK_ACCOUNT_NUMBER", "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS"]
	
	- **condition validate_tag_0_BPP_TERMS**: every element of $.message.order.tags[?(@.descriptor.code=='BPP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT"]
	
	- **condition validate_tag_1**: every element of $.message.order.items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO", "FEATURE_LIST"]
	
		> Note: **Condition validate_tag_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.items[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_1_DISABILITY_VIS**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT", "FEATURE_LIST"]
	
	- **condition validate_tag_1_DISABILITY_HEA**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_MOB**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_LEP**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_SPE**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_INTEL**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_MENTAL**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_BLOOD**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_DWARFISM**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_ACID_ATTACK_SURVIVOR**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_MULTIPLE_DIS**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_FARE_POLICY**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]
	
	- **condition validate_tag_1_INFO**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOURS", "TOTAL_DISTANCE"]
	
	- **condition validate_tag_2**: every element of $.message.order.fulfillments[*].tags[*].descriptor.code must be in ["ROUTE_INFO"]
	
		> Note: **Condition validate_tag_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_2_ROUTE_INFO**: every element of $.message.order.fulfillments[*].tags[?(@.descriptor.code=='ROUTE_INFO')].list[*].descriptor.code must be in ["ENCODED_POLYLINE", "WAYPOINTS"]

- **on_cancel** : All the following sub conditions must pass as per the api requirement

	- **condition FULFILLMENT_STATE_ENDED**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_ENDED", "RIDE_STARTED"]
	
		> Note: **Condition FULFILLMENT_STATE_ENDED** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of ["CLAIMED"] must **not** be in $.message.order.fulfillments[*].stops[*].authorization.status
	
	- **condition PAYMENT_STATUS_TRANSACTION_ID**: $.message.order.payments[*].params.transaction_id must be present in the payload
	
		> Note: **Condition PAYMENT_STATUS_TRANSACTION_ID** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]
	
	- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
	  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload
	
	- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
	  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["on_cancel"]
	
	- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_ID_12**: $.context.bpp_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_URI_13**: $.context.bpp_uri must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_14**: $.message.order.items[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_15**: $.message.order.items[*].descriptor.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CODE_16**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CODE_16.1**: $.message.order.items[*].descriptor.code must be present in the payload
	  - **condition REQUIRED_MESSAGE_CODE_16.2**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
	
	- **condition REQUIRED_MESSAGE_FULFILLMENT_IDS_17**: $.message.order.items[*].fulfillment_ids[*] must be present in the payload
	
	- **condition REQUIRED_MESSAGE_PAYMENT_IDS_18**: $.message.order.items[*].payment_ids[*] must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CURRENCY_19**: $.message.order.items[*].price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_VALUE_20**: $.message.order.items[*].price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_21**: $.message.order.provider.id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_22**: $.message.order.fulfillments[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TYPE_23**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TYPE_23.1**: $.message.order.fulfillments[*].type must be present in the payload
	  - **condition REQUIRED_MESSAGE_TYPE_23.2**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
	
	- **condition REQUIRED_MESSAGE_GPS_24**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_25**: $.message.order.fulfillments[*].customer.person.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_PHONE_26**: $.message.order.fulfillments[*].customer.contact.phone must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_27**: $.message.order.fulfillments[*].agent.person.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_PHONE_28**: $.message.order.fulfillments[*].agent.contact.phone must be present in the payload
	
	- **condition REQUIRED_MESSAGE_REGISTRATION_29**: $.message.order.fulfillments[*].vehicle.registration must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CATEGORY_30**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CATEGORY_30.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
	  - **condition REQUIRED_MESSAGE_CATEGORY_30.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
	- **condition REQUIRED_MESSAGE_MAKE_31**: $.message.order.fulfillments[*].vehicle.make must be present in the payload
	
	- **condition REQUIRED_MESSAGE_MODEL_32**: $.message.order.fulfillments[*].vehicle.model must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CODE_33**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CODE_33.1**: $.message.order.fulfillments[*].state.descriptor.code must be present in the payload
	  - **condition REQUIRED_MESSAGE_CODE_33.2**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
	- **condition REQUIRED_MESSAGE_TYPE_34**: $.message.order.fulfillments[*].type must be present in the payload
	
	- **condition REQUIRED_MESSAGE_VALUE_35**: $.message.order.quote.price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CURRENCY_36**: $.message.order.quote.price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TITLE_37**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TITLE_37.1**: $.message.order.quote.breakup[*].title must be present in the payload
	  - **condition REQUIRED_MESSAGE_TITLE_37.2**: every element of $.message.order.quote.breakup[*].title must be in ["BASE_FARE", "DISTANCE_FARE", "CANCELLATION_CHARGES", "REFUND", "TOLL_CHARGES", "PARKING_CHARGES", "TAX", "WAITING_CHARGES", "DRIVER_BATA", "NIGHT_CHARGES", "BUYER_ADDITIONAL_AMOUNT"]
	
	- **condition REQUIRED_MESSAGE_CURRENCY_38**: $.message.order.quote.breakup[*].price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_VALUE_39**: $.message.order.quote.breakup[*].price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_40**: $.message.order.payments[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TYPE_41**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TYPE_41.1**: $.message.order.payments[*].type must be present in the payload
	  - **condition REQUIRED_MESSAGE_TYPE_41.2**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
	- **condition REQUIRED_MESSAGE_COLLECTED_BY_44**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_44.1**: $.message.order.payments[*].collected_by must be present in the payload
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_44.2**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
	
	- **condition REQUIRED_MESSAGE_STATUS_45**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_STATUS_45.1**: $.message.order.payments[*].status must be present in the payload
	  - **condition REQUIRED_MESSAGE_STATUS_45.2**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
	
	- **condition REQUIRED_MESSAGE_CODE_46**: $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be present in the payload
	
	- **condition REQUIRED_MESSAGE_REASON_REQUIRED_47**: $.message.order.cancellation_terms[*].reason_required must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_48**: $.message.order.id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_STATUS_49**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_STATUS_49.1**: $.message.order.status must be present in the payload
	  - **condition REQUIRED_MESSAGE_STATUS_49.2**: every element of $.message.order.status must be in ["UPDATED", "SOFT_CANCEL", "CONFIRM_CANCEL", "ACTIVE", "COMPLETE", "CANCELLED", "CONFIRM_UPDATE", "SOFT_UPDATE"]
	
	- **condition VALID_ENUM_MESSAGE_VARIANT_1**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_VARIANT_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_ENERGY_TYPE_2**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_ENERGY_TYPE_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_3**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_3** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_4**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_4** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_CANCELLED_BY_5**: every element of $.message.order.cancellation.cancelled_by must be in ["CONSUMER", "PROVIDER"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CANCELLED_BY_5** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.cancellation.cancelled_by must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_CODE_6**: every element of $.message.order.cancellation.reason.descriptor.code must be in ["000", "001", "002", "003", "004", "005", "011", "012", "013", "014"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_CODE_6** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.cancellation.reason.descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_0**: every element of $.message.order.tags[*].descriptor.code must be in ["BAP_TERMS", "BPP_TERMS"]
	
		> Note: **Condition validate_tag_0** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_0_BAP_TERMS**: every element of $.message.order.tags[?(@.descriptor.code=='BAP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT", "SETTLEMENT_BANK_CODE", "SETTLEMENT_BANK_ACCOUNT_NUMBER", "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS"]
	
	- **condition validate_tag_0_BPP_TERMS**: every element of $.message.order.tags[?(@.descriptor.code=='BPP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT"]
	
	- **condition validate_tag_1**: every element of $.message.order.items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO", "FEATURE_LIST"]
	
		> Note: **Condition validate_tag_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.items[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_1_DISABILITY_VIS**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT", "FEATURE_LIST"]
	
	- **condition validate_tag_1_DISABILITY_HEA**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_MOB**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_LEP**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_SPE**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_INTEL**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_MENTAL**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_BLOOD**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_DWARFISM**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_ACID_ATTACK_SURVIVOR**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_MULTIPLE_DIS**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_FARE_POLICY**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]
	
	- **condition validate_tag_1_INFO**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOURS", "TOTAL_DISTANCE"]
	
	- **condition validate_tag_2**: every element of $.message.order.fulfillments[*].tags[*].descriptor.code must be in ["ROUTE_INFO"]
	
		> Note: **Condition validate_tag_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_2_ROUTE_INFO**: every element of $.message.order.fulfillments[*].tags[?(@.descriptor.code=='ROUTE_INFO')].list[*].descriptor.code must be in ["ENCODED_POLYLINE", "WAYPOINTS"]

- **on_update** : All the following sub conditions must pass as per the api requirement

	- **condition FULFILLMENT_STATE_ENDED**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_ENDED", "RIDE_STARTED"]
	
		> Note: **Condition FULFILLMENT_STATE_ENDED** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of ["CLAIMED"] must **not** be in $.message.order.fulfillments[*].stops[*].authorization.status
	
	- **condition PAYMENT_STATUS_TRANSACTION_ID**: $.message.order.payments[*].params.transaction_id must be present in the payload
	
		> Note: **Condition PAYMENT_STATUS_TRANSACTION_ID** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]
	
	- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
	  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload
	
	- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
	  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["on_update"]
	
	- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_ID_12**: $.context.bpp_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_URI_13**: $.context.bpp_uri must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_14**: $.message.order.items[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_15**: $.message.order.items[*].descriptor.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CODE_16**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CODE_16.1**: $.message.order.items[*].descriptor.code must be present in the payload
	  - **condition REQUIRED_MESSAGE_CODE_16.2**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
	
	- **condition REQUIRED_MESSAGE_CURRENCY_17**: $.message.order.items[*].price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_VALUE_18**: $.message.order.items[*].price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_FULFILLMENT_IDS_19**: $.message.order.items[*].fulfillment_ids[*] must be present in the payload
	
	- **condition REQUIRED_MESSAGE_PAYMENT_IDS_20**: $.message.order.items[*].payment_ids[*] must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_21**: $.message.order.provider.id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_22**: $.message.order.fulfillments[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TYPE_23**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TYPE_23.1**: $.message.order.fulfillments[*].type must be present in the payload
	  - **condition REQUIRED_MESSAGE_TYPE_23.2**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
	
	- **condition REQUIRED_MESSAGE_GPS_24**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CATEGORY_25**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CATEGORY_25.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
	  - **condition REQUIRED_MESSAGE_CATEGORY_25.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
	- **condition REQUIRED_MESSAGE_REGISTRATION_26**: $.message.order.fulfillments[*].vehicle.registration must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_27**: $.message.order.fulfillments[*].customer.person.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_PHONE_28**: $.message.order.fulfillments[*].customer.contact.phone must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_29**: $.message.order.fulfillments[*].agent.person.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_PHONE_30**: $.message.order.fulfillments[*].agent.contact.phone must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TYPE_31**: $.message.order.fulfillments[*].type must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CODE_32**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CODE_32.1**: $.message.order.fulfillments[*].state.descriptor.code must be present in the payload
	  - **condition REQUIRED_MESSAGE_CODE_32.2**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
	- **condition REQUIRED_MESSAGE_VALUE_33**: $.message.order.quote.price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CURRENCY_34**: $.message.order.quote.price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TITLE_35**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TITLE_35.1**: $.message.order.quote.breakup[*].title must be present in the payload
	  - **condition REQUIRED_MESSAGE_TITLE_35.2**: every element of $.message.order.quote.breakup[*].title must be in ["BASE_FARE", "DISTANCE_FARE", "CANCELLATION_CHARGES", "REFUND", "TOLL_CHARGES", "PARKING_CHARGES", "TAX", "WAITING_CHARGES", "DRIVER_BATA", "NIGHT_CHARGES", "BUYER_ADDITIONAL_AMOUNT"]
	
	- **condition REQUIRED_MESSAGE_CURRENCY_36**: $.message.order.quote.breakup[*].price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_VALUE_37**: $.message.order.quote.breakup[*].price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_38**: $.message.order.payments[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_COLLECTED_BY_39**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_39.1**: $.message.order.payments[*].collected_by must be present in the payload
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_39.2**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
	
	- **condition REQUIRED_MESSAGE_STATUS_40**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_STATUS_40.1**: $.message.order.payments[*].status must be present in the payload
	  - **condition REQUIRED_MESSAGE_STATUS_40.2**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
	
	- **condition REQUIRED_MESSAGE_TYPE_41**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TYPE_41.1**: $.message.order.payments[*].type must be present in the payload
	  - **condition REQUIRED_MESSAGE_TYPE_41.2**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
	- **condition REQUIRED_MESSAGE_CODE_45**: $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be present in the payload
	
	- **condition REQUIRED_MESSAGE_REASON_REQUIRED_46**: $.message.order.cancellation_terms[*].reason_required must be present in the payload
	
	- **condition REQUIRED_MESSAGE_STATUS_47**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_STATUS_47.1**: $.message.order.status must be present in the payload
	  - **condition REQUIRED_MESSAGE_STATUS_47.2**: every element of $.message.order.status must be in ["UPDATED", "SOFT_CANCEL", "CONFIRM_CANCEL", "ACTIVE", "COMPLETE", "CANCELLED", "CONFIRM_UPDATE", "SOFT_UPDATE"]
	
	- **condition REQUIRED_MESSAGE_CREATED_AT_48**: $.message.order.created_at must be present in the payload
	
	- **condition REQUIRED_MESSAGE_UPDATED_AT_49**: $.message.order.updated_at must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_50**: $.message.order.id must be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_VARIANT_1**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_VARIANT_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_ENERGY_TYPE_2**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_ENERGY_TYPE_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_3**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_3** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_4**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_4** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
	
	- **condition validate_tag_0**: every element of $.message.order.tags[*].descriptor.code must be in ["BAP_TERMS", "BPP_TERMS"]
	
		> Note: **Condition validate_tag_0** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_0_BAP_TERMS**: every element of $.message.order.tags[?(@.descriptor.code=='BAP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT", "SETTLEMENT_BANK_CODE", "SETTLEMENT_BANK_ACCOUNT_NUMBER", "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS"]
	
	- **condition validate_tag_0_BPP_TERMS**: every element of $.message.order.tags[?(@.descriptor.code=='BPP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT"]
	
	- **condition validate_tag_1**: every element of $.message.order.items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO", "FEATURE_LIST"]
	
		> Note: **Condition validate_tag_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.items[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_1_DISABILITY_VIS**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT", "FEATURE_LIST"]
	
	- **condition validate_tag_1_DISABILITY_HEA**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_MOB**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_LEP**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_SPE**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_INTEL**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_MENTAL**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_BLOOD**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_DWARFISM**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_ACID_ATTACK_SURVIVOR**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_MULTIPLE_DIS**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_FARE_POLICY**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]
	
	- **condition validate_tag_1_INFO**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOURS", "TOTAL_DISTANCE"]
	
	- **condition validate_tag_2**: every element of $.message.order.fulfillments[*].tags[*].descriptor.code must be in ["ROUTE_INFO"]
	
		> Note: **Condition validate_tag_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_2_ROUTE_INFO**: every element of $.message.order.fulfillments[*].tags[?(@.descriptor.code=='ROUTE_INFO')].list[*].descriptor.code must be in ["ENCODED_POLYLINE", "WAYPOINTS"]

- **on_status** : All the following sub conditions must pass as per the api requirement

	- **condition FULFILLMENT_STATE_ENDED**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_ENDED", "RIDE_STARTED"]
	
		> Note: **Condition FULFILLMENT_STATE_ENDED** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of ["CLAIMED"] must **not** be in $.message.order.fulfillments[*].stops[*].authorization.status
	
	- **condition PAYMENT_STATUS_TRANSACTION_ID**: $.message.order.payments[*].params.transaction_id must be present in the payload
	
		> Note: **Condition PAYMENT_STATUS_TRANSACTION_ID** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]
	
	- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
	  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload
	
	- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
	  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["on_status"]
	
	- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_ID_12**: $.context.bpp_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_URI_13**: $.context.bpp_uri must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_14**: $.message.order.items[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_15**: $.message.order.items[*].descriptor.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CODE_16**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CODE_16.1**: $.message.order.items[*].descriptor.code must be present in the payload
	  - **condition REQUIRED_MESSAGE_CODE_16.2**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
	
	- **condition REQUIRED_MESSAGE_CURRENCY_17**: $.message.order.items[*].price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_VALUE_18**: $.message.order.items[*].price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_FULFILLMENT_IDS_19**: $.message.order.items[*].fulfillment_ids[*] must be present in the payload
	
	- **condition REQUIRED_MESSAGE_PAYMENT_IDS_20**: $.message.order.items[*].payment_ids[*] must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_21**: $.message.order.provider.id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_22**: $.message.order.fulfillments[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TYPE_23**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TYPE_23.1**: $.message.order.fulfillments[*].type must be present in the payload
	  - **condition REQUIRED_MESSAGE_TYPE_23.2**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
	
	- **condition REQUIRED_MESSAGE_GPS_24**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CATEGORY_25**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CATEGORY_25.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
	  - **condition REQUIRED_MESSAGE_CATEGORY_25.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
	- **condition REQUIRED_MESSAGE_REGISTRATION_26**: $.message.order.fulfillments[*].vehicle.registration must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_27**: $.message.order.fulfillments[*].customer.person.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_PHONE_28**: $.message.order.fulfillments[*].customer.contact.phone must be present in the payload
	
	- **condition REQUIRED_MESSAGE_NAME_29**: $.message.order.fulfillments[*].agent.person.name must be present in the payload
	
	- **condition REQUIRED_MESSAGE_PHONE_30**: $.message.order.fulfillments[*].agent.contact.phone must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TYPE_31**: $.message.order.fulfillments[*].type must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CODE_32**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CODE_32.1**: $.message.order.fulfillments[*].state.descriptor.code must be present in the payload
	  - **condition REQUIRED_MESSAGE_CODE_32.2**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
	- **condition REQUIRED_MESSAGE_VALUE_33**: $.message.order.quote.price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_CURRENCY_34**: $.message.order.quote.price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_TITLE_35**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TITLE_35.1**: $.message.order.quote.breakup[*].title must be present in the payload
	  - **condition REQUIRED_MESSAGE_TITLE_35.2**: every element of $.message.order.quote.breakup[*].title must be in ["BASE_FARE", "DISTANCE_FARE", "CANCELLATION_CHARGES", "REFUND", "TOLL_CHARGES", "PARKING_CHARGES", "TAX", "WAITING_CHARGES", "DRIVER_BATA", "NIGHT_CHARGES", "BUYER_ADDITIONAL_AMOUNT"]
	
	- **condition REQUIRED_MESSAGE_CURRENCY_36**: $.message.order.quote.breakup[*].price.currency must be present in the payload
	
	- **condition REQUIRED_MESSAGE_VALUE_37**: $.message.order.quote.breakup[*].price.value must be present in the payload
	
	- **condition REQUIRED_MESSAGE_ID_38**: $.message.order.payments[*].id must be present in the payload
	
	- **condition REQUIRED_MESSAGE_COLLECTED_BY_39**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_39.1**: $.message.order.payments[*].collected_by must be present in the payload
	  - **condition REQUIRED_MESSAGE_COLLECTED_BY_39.2**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
	
	- **condition REQUIRED_MESSAGE_STATUS_40**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_STATUS_40.1**: $.message.order.payments[*].status must be present in the payload
	  - **condition REQUIRED_MESSAGE_STATUS_40.2**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
	
	- **condition REQUIRED_MESSAGE_TYPE_41**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_TYPE_41.1**: $.message.order.payments[*].type must be present in the payload
	  - **condition REQUIRED_MESSAGE_TYPE_41.2**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
	- **condition REQUIRED_MESSAGE_CODE_45**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_MESSAGE_CODE_45.1**: $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be present in the payload
	  - **condition REQUIRED_MESSAGE_CODE_45.2**: every element of $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
	- **condition REQUIRED_MESSAGE_REASON_REQUIRED_46**: $.message.order.cancellation_terms[*].reason_required must be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_VARIANT_1**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_VARIANT_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_ENERGY_TYPE_2**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_ENERGY_TYPE_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_TYPE_3**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_TYPE_3** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_4**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_4** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
	
	- **condition VALID_ENUM_MESSAGE_STATUS_5**: every element of $.message.order.status must be in ["SOFT_CANCEL", "CONFIRM_CANCEL", "ACTIVE", "COMPLETE", "CANCELLED", "CONFIRM_UPDATE", "UPDATED", "SOFT_UPDATE"]
	
		> Note: **Condition VALID_ENUM_MESSAGE_STATUS_5** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.status must **not** be present in the payload
	
	- **condition validate_tag_0**: every element of $.message.order.tags[*].descriptor.code must be in ["BAP_TERMS", "BPP_TERMS"]
	
		> Note: **Condition validate_tag_0** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_0_BAP_TERMS**: every element of $.message.order.tags[?(@.descriptor.code=='BAP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT", "SETTLEMENT_BANK_CODE", "SETTLEMENT_BANK_ACCOUNT_NUMBER", "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS"]
	
	- **condition validate_tag_0_BPP_TERMS**: every element of $.message.order.tags[?(@.descriptor.code=='BPP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT"]
	
	- **condition validate_tag_1**: every element of $.message.order.items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO", "FEATURE_LIST"]
	
		> Note: **Condition validate_tag_1** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.items[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_1_DISABILITY_VIS**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT", "FEATURE_LIST"]
	
	- **condition validate_tag_1_DISABILITY_HEA**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_MOB**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_LEP**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_SPE**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_INTEL**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_MENTAL**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_BLOOD**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_DWARFISM**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_ACID_ATTACK_SURVIVOR**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_DISABILITY_MULTIPLE_DIS**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition validate_tag_1_FARE_POLICY**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]
	
	- **condition validate_tag_1_INFO**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOURS", "TOTAL_DISTANCE"]
	
	- **condition validate_tag_2**: every element of $.message.order.fulfillments[*].tags[*].descriptor.code must be in ["ROUTE_INFO"]
	
		> Note: **Condition validate_tag_2** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition validate_tag_2_ROUTE_INFO**: every element of $.message.order.fulfillments[*].tags[?(@.descriptor.code=='ROUTE_INFO')].list[*].descriptor.code must be in ["ENCODED_POLYLINE", "WAYPOINTS"]

- **track** : All the following sub conditions must pass as per the api requirement

	- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
	  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload
	
	- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
	  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["track"]
	
	- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_ID_12**: $.context.bpp_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_URI_13**: $.context.bpp_uri must be present in the payload

- **on_track** : All the following sub conditions must pass as per the api requirement

	- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
	  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
	  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload
	
	- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:
	
	  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
	  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["on_track"]
	
	- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload
	
	- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_ID_12**: $.context.bpp_id must be present in the payload
	
	- **condition REQUIRED_CONTEXT_BPP_URI_13**: $.context.bpp_uri must be present in the payload