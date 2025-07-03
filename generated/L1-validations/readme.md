

- **search** : All the following sub conditions must pass as per the api requirement

	Country code must be present and valid
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.domain must be present in the payload
	  - **condition A.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition A**: $.context.timestamp must be present in the payload
	
	- **condition A**: $.context.bap_id must be present in the payload
	
	- **condition A**: $.context.transaction_id must be present in the payload
	
	- **condition A**: $.context.message_id must be present in the payload
	
	- **condition A**: $.context.version must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.action must be present in the payload
	  - **condition A.2**: every element of $.context.action must be in ["search"]
	
	- **condition A**: $.context.bap_uri must be present in the payload
	
	- **condition A**: $.context.ttl must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.message.intent.fulfillment.stops[*].type must be present in the payload
	  - **condition A.2**: every element of $.message.intent.fulfillment.stops[*].type must be in ["START", "END", "INTERMEDIATE_STOP"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.message.intent.payment.collected_by must be present in the payload
	  - **condition A.2**: every element of $.message.intent.payment.collected_by must be in ["BPP", "BAP"]
	
	- **condition A**: every element of $.message.intent.category.descriptor.code must be in ["ON_DEMAND_TRIP", "ON_DEMAND_RENTAL", "SCHEDULED_TRIP", "SCHEDULED_RENTAL"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.category.descriptor.code must **not** be present in the payload
	
	- **condition A**: every element of $.message.intent.fulfillment.vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.fulfillment.vehicle.category must **not** be present in the payload
	
	- **condition A**: every element of $.message.intent.fulfillment.vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.fulfillment.vehicle.variant must **not** be present in the payload
	
	- **condition A**: every element of $.message.intent.fulfillment.vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.fulfillment.vehicle.energy_type must **not** be present in the payload
	
	- **condition A**: every element of $.message.intent.fulfillment.type must be in ["DELIVERY", "SELF_PICKUP"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.fulfillment.type must **not** be present in the payload
	
	- **condition A**: every element of $.message.intent.fulfillment.stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.fulfillment.stops[*].authorization.type must **not** be present in the payload
	
	- **condition A**: every element of $.message.intent.fulfillment.stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.fulfillment.stops[*].authorization.status must **not** be present in the payload
	
	- **condition A**: every element of $.message.intent.fulfillment.state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.fulfillment.state.descriptor.code must **not** be present in the payload
	
	- **condition A**: every element of $.message.intent.payment.status must be in ["NOT-PAID", "PAID"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.payment.status must **not** be present in the payload
	
	- **condition A**: every element of $.message.intent.payment.type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.payment.type must **not** be present in the payload
	
	- **condition A**: every element of $.message.intent.tags[*].descriptor.code must be in ["BAP_TERMS"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.tags[*].descriptor.code must **not** be present in the payload
	
	- **condition A**: every element of $.message.intent.tags[?(@.descriptor.code=='BAP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT", "SETTLEMENT_BANK_CODE", "SETTLEMENT_BANK_ACCOUNT_NUMBER", "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS"]
	
	- **condition A**: every element of $.message.intent.item.tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.intent.item.tags[*].descriptor.code must **not** be present in the payload
	
	- **condition A**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.intent.item.tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]

- **select** : All the following sub conditions must pass as per the api requirement

	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.location.country.code must be present in the payload
	  - **condition A.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.domain must be present in the payload
	  - **condition A.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition A**: $.context.timestamp must be present in the payload
	
	- **condition A**: $.context.bap_id must be present in the payload
	
	- **condition A**: $.context.transaction_id must be present in the payload
	
	- **condition A**: $.context.message_id must be present in the payload
	
	- **condition A**: $.context.version must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.action must be present in the payload
	  - **condition A.2**: every element of $.context.action must be in ["select"]
	
	- **condition A**: $.context.bap_uri must be present in the payload
	
	- **condition A**: $.context.ttl must be present in the payload
	
	- **condition A**: $.context.bpp_id must be present in the payload
	
	- **condition A**: $.context.bpp_uri must be present in the payload
	
	- **condition A**: $.message.order.items[*].id must be present in the payload
	
	- **condition A**: $.message.order.provider.id must be present in the payload
	
	- **condition A**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.items[*].descriptor.code must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.category must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].type must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].type must be in ["START", "END", "INTERMEDIATE_STOP"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].type must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].state.descriptor.code must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.payments[*].status must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.payments[*].collected_by must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.payments[*].type must **not** be present in the payload

- **init** : All the following sub conditions must pass as per the api requirement

	- **condition A**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_ENDED"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of ["CLAIMED"] must **not** be in $.message.order.fulfillments[*].stops[*].authorization.status
	
	- **condition A**: $.message.order.payments[*].params.transaction_id must be present in the payload
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.location.country.code must be present in the payload
	  - **condition A.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.domain must be present in the payload
	  - **condition A.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition A**: $.context.timestamp must be present in the payload
	
	- **condition A**: $.context.bap_id must be present in the payload
	
	- **condition A**: $.context.transaction_id must be present in the payload
	
	- **condition A**: $.context.message_id must be present in the payload
	
	- **condition A**: $.context.version must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.action must be present in the payload
	  - **condition A.2**: every element of $.context.action must be in ["init"]
	
	- **condition A**: $.context.bap_uri must be present in the payload
	
	- **condition A**: $.context.ttl must be present in the payload
	
	- **condition A**: $.context.bpp_id must be present in the payload
	
	- **condition A**: $.context.bpp_uri must be present in the payload
	
	- **condition A**: $.message.order.items[*].id must be present in the payload
	
	- **condition A**: $.message.order.provider.id must be present in the payload
	
	- **condition A**: $.message.order.billing.name must be present in the payload
	
	- **condition A**: $.message.order.fulfillments[*].id must be present in the payload
	
	- **condition A**: $.message.order.fulfillments[*].customer.person.name must be present in the payload
	
	- **condition A**: $.message.order.fulfillments[*].customer.contact.phone must be present in the payload
	
	- **condition A**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
	  - **condition A.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.message.order.payments[*].collected_by must be present in the payload
	  - **condition A.2**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.message.order.payments[*].status must be present in the payload
	  - **condition A.2**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.message.order.payments[*].type must be present in the payload
	  - **condition A.2**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
	- **condition A**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.items[*].descriptor.code must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].state.descriptor.code must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.tags[*].descriptor.code must be in ["BAP_TERMS"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.tags[*].descriptor.code must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.tags[?(@.descriptor.code=='BAP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT", "SETTLEMENT_BANK_CODE", "SETTLEMENT_BANK_ACCOUNT_NUMBER", "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS"]

- **confirm** : All the following sub conditions must pass as per the api requirement

	- **condition A**: $.message.order.payments[*].params.transaction_id must be present in the payload
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.location.country.code must be present in the payload
	  - **condition A.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.domain must be present in the payload
	  - **condition A.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition A**: $.context.timestamp must be present in the payload
	
	- **condition A**: $.context.bap_id must be present in the payload
	
	- **condition A**: $.context.transaction_id must be present in the payload
	
	- **condition A**: $.context.message_id must be present in the payload
	
	- **condition A**: $.context.version must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.action must be present in the payload
	  - **condition A.2**: every element of $.context.action must be in ["confirm"]
	
	- **condition A**: $.context.bap_uri must be present in the payload
	
	- **condition A**: $.context.ttl must be present in the payload
	
	- **condition A**: $.context.bpp_id must be present in the payload
	
	- **condition A**: $.context.bpp_uri must be present in the payload
	
	- **condition A**: $.message.order.items[*].id must be present in the payload
	
	- **condition A**: $.message.order.provider.id must be present in the payload
	
	- **condition A**: $.message.order.billing.name must be present in the payload
	
	- **condition A**: $.message.order.payments[*].id must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.message.order.payments[*].collected_by must be present in the payload
	  - **condition A.2**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.message.order.payments[*].status must be present in the payload
	  - **condition A.2**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.message.order.payments[*].type must be present in the payload
	  - **condition A.2**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
	- **condition A**: $.message.order.fulfillments[*].id must be present in the payload
	
	- **condition A**: $.message.order.fulfillments[*].customer.person.name must be present in the payload
	
	- **condition A**: $.message.order.fulfillments[*].customer.contact.phone must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.message.order.fulfillments[*].type must be present in the payload
	  - **condition A.2**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
	
	- **condition A**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
	  - **condition A.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
	- **condition A**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.items[*].descriptor.code must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].state.descriptor.code must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.tags[*].descriptor.code must be in ["BAP_TERMS", "BPP_TERMS"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.tags[*].descriptor.code must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.tags[?(@.descriptor.code=='BAP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT", "SETTLEMENT_BANK_CODE", "SETTLEMENT_BANK_ACCOUNT_NUMBER", "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS"]
	
	- **condition A**: every element of $.message.order.tags[?(@.descriptor.code=='BPP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT"]
	
	- **condition A**: every element of $.message.order.items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.items[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT", "FEATURE_LIST"]
	
	- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
	
	- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]
	
	- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOURS", "TOTAL_DISTANCE"]
	
	- **condition A**: every element of $.message.order.fulfillments[*].tags[*].descriptor.code must be in ["ROUTE_INFO"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].tags[*].descriptor.code must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].tags[?(@.descriptor.code=='ROUTE_INFO')].list[*].descriptor.code must be in ["ENCODED_POLYLINE", "WAYPOINTS"]

- **status** : All the following sub conditions must pass as per the api requirement

	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.location.country.code must be present in the payload
	  - **condition A.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.domain must be present in the payload
	  - **condition A.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition A**: $.context.timestamp must be present in the payload
	
	- **condition A**: $.context.bap_id must be present in the payload
	
	- **condition A**: $.context.transaction_id must be present in the payload
	
	- **condition A**: $.context.message_id must be present in the payload
	
	- **condition A**: $.context.version must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.action must be present in the payload
	  - **condition A.2**: every element of $.context.action must be in ["status"]
	
	- **condition A**: $.context.bap_uri must be present in the payload
	
	- **condition A**: $.context.ttl must be present in the payload
	
	- **condition A**: $.context.bpp_id must be present in the payload
	
	- **condition A**: $.context.bpp_uri must be present in the payload

- **cancel** : All the following sub conditions must pass as per the api requirement

	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.location.country.code must be present in the payload
	  - **condition A.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.domain must be present in the payload
	  - **condition A.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition A**: $.context.timestamp must be present in the payload
	
	- **condition A**: $.context.bap_id must be present in the payload
	
	- **condition A**: $.context.transaction_id must be present in the payload
	
	- **condition A**: $.context.message_id must be present in the payload
	
	- **condition A**: $.context.version must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.action must be present in the payload
	  - **condition A.2**: every element of $.context.action must be in ["cancel"]
	
	- **condition A**: $.context.bap_uri must be present in the payload
	
	- **condition A**: $.context.ttl must be present in the payload
	
	- **condition A**: $.context.bpp_id must be present in the payload
	
	- **condition A**: $.context.bpp_uri must be present in the payload
	
	- **condition A**: $.message.order_id must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.message.cancellation_reason_id must be present in the payload
	  - **condition A.2**: every element of $.message.cancellation_reason_id must be in ["000", "001", "002", "003", "004", "005", "011", "012", "013", "014"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.message.descriptor.code must be present in the payload
	  - **condition A.2**: every element of $.message.descriptor.code must be in ["SOFT_CANCEL", "CONFIRM_CANCEL", "ACTIVE", "COMPLETE", "CANCELLED", "UPDATED", "CONFIRM_UPDATE"]

- **update** : All the following sub conditions must pass as per the api requirement

	- **condition A**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_ENDED", "RIDE_STARTED"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of ["CLAIMED"] must **not** be in $.message.order.fulfillments[*].stops[*].authorization.status
	
	- **condition A**: $.message.order.payments[*].params.transaction_id must be present in the payload
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.location.country.code must be present in the payload
	  - **condition A.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.domain must be present in the payload
	  - **condition A.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition A**: $.context.timestamp must be present in the payload
	
	- **condition A**: $.context.bap_id must be present in the payload
	
	- **condition A**: $.context.transaction_id must be present in the payload
	
	- **condition A**: $.context.message_id must be present in the payload
	
	- **condition A**: $.context.version must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.action must be present in the payload
	  - **condition A.2**: every element of $.context.action must be in ["update"]
	
	- **condition A**: $.context.bap_uri must be present in the payload
	
	- **condition A**: $.context.ttl must be present in the payload
	
	- **condition A**: $.context.bpp_id must be present in the payload
	
	- **condition A**: $.context.bpp_uri must be present in the payload
	
	- **condition A**: $.message.order.id must be present in the payload
	
	- **condition A**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.items[*].descriptor.code must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.category must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].type must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].type must be in ["START", "END", "INTERMEDIATE_STOP"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].type must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.fulfillments[*].state.descriptor.code must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.payments[*].status must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.payments[*].collected_by must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.payments[*].type must **not** be present in the payload
	
	- **condition A**: every element of $.message.order.quote.breakup[*].title must be in ["BASE_FARE", "DISTANCE_FARE", "CANCELLATION_CHARGES", "REFUND", "TOLL_CHARGES", "PARKING_CHARGES", "TAX", "WAITING_CHARGES", "DRIVER_BATA", "NIGHT_CHARGES", "BUYER_ADDITIONAL_AMOUNT", "ADD_ONS"]
	
		> Note: **Condition A** can be skipped if the following conditions are met:
		>
		> - **condition B**: $.message.order.quote.breakup[*].title must **not** be present in the payload

- **on_search** : All the following sub conditions must pass as per the api requirement

	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.location.country.code must be present in the payload
	  - **condition A.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.domain must be present in the payload
	  - **condition A.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition A**: $.context.timestamp must be present in the payload
	
	- **condition A**: $.context.bap_id must be present in the payload
	
	- **condition A**: $.context.transaction_id must be present in the payload
	
	- **condition A**: $.context.message_id must be present in the payload
	
	- **condition A**: $.context.version must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.action must be present in the payload
	  - **condition A.2**: every element of $.context.action must be in ["on_search"]
	
	- **condition A**: $.context.bap_uri must be present in the payload
	
	- **condition A**: $.context.ttl must be present in the payload
	
	- **condition A**: $.context.bpp_id must be present in the payload
	
	- **condition A**: $.context.bpp_uri must be present in the payload
	
	- **on_search_Message_TESTS** : All the following sub conditions must pass as per the api requirement
	
		- **condition A**: $.message.catalog.descriptor.name must be present in the payload
		
		- **condition A**: $.message.catalog.providers[*].id must be present in the payload
		
		- **condition A**: $.message.catalog.providers[*].fulfillments[*].id must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.catalog.providers[*].fulfillments[*].type must be present in the payload
		  - **condition A.2**: every element of $.message.catalog.providers[*].fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
		
		- **condition A**: $.message.catalog.providers[*].fulfillments[*].type must be present in the payload
		
		- **condition A**: $.message.catalog.providers[*].fulfillments[*].stops[*].location.gps must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.catalog.providers[*].fulfillments[*].vehicle.category must be present in the payload
		  - **condition A.2**: every element of $.message.catalog.providers[*].fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
		
		- **condition A**: $.message.catalog.providers[*].id must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.catalog.providers[*].items[*].descriptor.code must be present in the payload
		  - **condition A.2**: every element of $.message.catalog.providers[*].items[*].descriptor.code must be in ["RIDE", "RENTAL", "INTERMEDIATE_STOP"]
		
		- **condition A**: $.message.catalog.providers[*].items[*].price.currency must be present in the payload
		
		- **condition A**: $.message.catalog.providers[*].items[*].price.value must be present in the payload
		
		- **condition A**: $.message.catalog.providers[*].items[*].fulfillment_ids[*] must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.catalog.providers[*].payments[*].collected_by must be present in the payload
		  - **condition A.2**: every element of $.message.catalog.providers[*].payments[*].collected_by must be in ["BPP", "BAP"]
		
		- **condition A**: every element of $.message.catalog.providers[*].fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.catalog.providers[*].fulfillments[*].vehicle.variant must **not** be present in the payload
		
		- **condition A**: every element of $.message.catalog.providers[*].fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.catalog.providers[*].fulfillments[*].vehicle.energy_type must **not** be present in the payload
		
		- **condition A**: every element of $.message.catalog.providers[*].fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.catalog.providers[*].fulfillments[*].stops[*].authorization.type must **not** be present in the payload
		
		- **condition A**: every element of $.message.catalog.providers[*].fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.catalog.providers[*].fulfillments[*].stops[*].authorization.status must **not** be present in the payload
		
		- **condition A**: every element of $.message.catalog.providers[*].fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.catalog.providers[*].fulfillments[*].state.descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.catalog.providers[*].payments[*].status must be in ["NOT-PAID", "PAID"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.catalog.providers[*].payments[*].status must **not** be present in the payload
		
		- **condition A**: every element of $.message.catalog.providers[*].payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.catalog.providers[*].payments[*].type must **not** be present in the payload
		
		- **condition A**: every element of $.message.catalog.providers[*].categories[*].descriptor.code must be in ["ON_DEMAND_TRIP", "ON_DEMAND_RENTAL", "SCHEDULED_TRIP", "SCHEDULED_RENTAL"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.catalog.providers[*].categories[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.catalog.tags[*].descriptor.code must be in ["BPP_TERMS"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.catalog.tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.catalog.tags[?(@.descriptor.code=='BPP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT"]
		
		- **condition A**: every element of $.message.catalog.providers[*].items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO", "FEATURE_LIST"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.catalog.providers[*].items[*].tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]
		
		- **condition A**: every element of $.message.catalog.providers[*].items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOUR", "TOTAL_DISTANCE"]

- **on_select** : All the following sub conditions must pass as per the api requirement

	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.location.country.code must be present in the payload
	  - **condition A.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.domain must be present in the payload
	  - **condition A.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition A**: $.context.timestamp must be present in the payload
	
	- **condition A**: $.context.bap_id must be present in the payload
	
	- **condition A**: $.context.transaction_id must be present in the payload
	
	- **condition A**: $.context.message_id must be present in the payload
	
	- **condition A**: $.context.version must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.action must be present in the payload
	  - **condition A.2**: every element of $.context.action must be in ["on_select"]
	
	- **condition A**: $.context.bap_uri must be present in the payload
	
	- **condition A**: $.context.ttl must be present in the payload
	
	- **condition A**: $.context.bpp_id must be present in the payload
	
	- **condition A**: $.context.bpp_uri must be present in the payload
	
	- **on_select_Message_TESTS** : All the following sub conditions must pass as per the api requirement
	
		- **condition A**: $.message.order.items[*].id must be present in the payload
		
		- **condition A**: $.message.order.items[*].descriptor.name must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.items[*].descriptor.code must be present in the payload
		  - **condition A.2**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
		
		- **condition A**: $.message.order.items[*].price.currency must be present in the payload
		
		- **condition A**: $.message.order.items[*].price.value must be present in the payload
		
		- **condition A**: $.message.order.items[*].fulfillment_ids[*] must be present in the payload
		
		- **condition A**: $.message.order.provider.id must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].id must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.fulfillments[*].type must be present in the payload
		  - **condition A.2**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
		
		- **condition A**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
		  - **condition A.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
		
		- **condition A**: $.message.order.quote.price.value must be present in the payload
		
		- **condition A**: $.message.order.quote.price.currency must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.quote.breakup[*].title must be present in the payload
		  - **condition A.2**: every element of $.message.order.quote.breakup[*].title must be in ["BASE_FARE", "DISTANCE_FARE", "CANCELLATION_CHARGES", "REFUND", "TOLL_CHARGES", "PARKING_CHARGES", "TAX", "WAITING_CHARGES", "DRIVER_BATA", "NIGHT_CHARGES", "BUYER_ADDITIONAL_AMOUNT", "ADD_ONS"]
		
		- **condition A**: $.message.order.quote.breakup[*].price.value must be present in the payload
		
		- **condition A**: $.message.order.quote.breakup[*].price.currency must be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].state.descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.payments[*].status must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.payments[*].collected_by must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.payments[*].type must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO", "FEATURE_LIST"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.items[*].tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT", "FEATURE_LIST"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOURS", "TOTAL_DISTANCE"]
		
		- **condition A**: every element of $.message.order.fulfillments[*].tags[*].descriptor.code must be in ["ROUTE_INFO"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].tags[?(@.descriptor.code=='ROUTE_INFO')].list[*].descriptor.code must be in ["ENCODED_POLYLINE", "WAYPOINTS"]

- **on_init** : All the following sub conditions must pass as per the api requirement

	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.location.country.code must be present in the payload
	  - **condition A.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.domain must be present in the payload
	  - **condition A.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition A**: $.context.timestamp must be present in the payload
	
	- **condition A**: $.context.bap_id must be present in the payload
	
	- **condition A**: $.context.transaction_id must be present in the payload
	
	- **condition A**: $.context.message_id must be present in the payload
	
	- **condition A**: $.context.version must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.action must be present in the payload
	  - **condition A.2**: every element of $.context.action must be in ["on_init"]
	
	- **condition A**: $.context.bap_uri must be present in the payload
	
	- **condition A**: $.context.ttl must be present in the payload
	
	- **condition A**: $.context.bpp_id must be present in the payload
	
	- **condition A**: $.context.bpp_uri must be present in the payload
	
	- **on_init_Message_TESTS** : All the following sub conditions must pass as per the api requirement
	
		- **condition A**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_ENDED", "RIDE_STARTED"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: every element of ["CLAIMED"] must **not** be in $.message.order.fulfillments[*].stops[*].authorization.status
		
		- **condition A**: $.message.order.payments[*].params.transaction_id must be present in the payload
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]
		
		- **condition A**: $.message.order.items[*].id must be present in the payload
		
		- **condition A**: $.message.order.items[*].descriptor.name must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.items[*].descriptor.code must be present in the payload
		  - **condition A.2**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
		
		- **condition A**: $.message.order.items[*].price.currency must be present in the payload
		
		- **condition A**: $.message.order.items[*].price.value must be present in the payload
		
		- **condition A**: $.message.order.items[*].fulfillment_ids[*] must be present in the payload
		
		- **condition A**: $.message.order.items[*].payment_ids[*] must be present in the payload
		
		- **condition A**: $.message.order.provider.id must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].id must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.fulfillments[*].type must be present in the payload
		  - **condition A.2**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
		
		- **condition A**: $.message.order.fulfillments[*].type must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
		  - **condition A.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
		
		- **condition A**: $.message.order.fulfillments[*].customer.person.name must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].customer.contact.phone must be present in the payload
		
		- **condition A**: $.message.order.quote.price.value must be present in the payload
		
		- **condition A**: $.message.order.quote.price.currency must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.quote.breakup[*].title must be present in the payload
		  - **condition A.2**: every element of $.message.order.quote.breakup[*].title must be in ["BASE_FARE", "DISTANCE_FARE", "CANCELLATION_CHARGES", "REFUND", "TOLL_CHARGES", "PARKING_CHARGES", "TAX", "WAITING_CHARGES", "DRIVER_BATA", "NIGHT_CHARGES", "ADD_ONS"]
		
		- **condition A**: $.message.order.quote.breakup[*].price.currency must be present in the payload
		
		- **condition A**: $.message.order.quote.breakup[*].price.value must be present in the payload
		
		- **condition A**: $.message.order.payments[*].id must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.payments[*].collected_by must be present in the payload
		  - **condition A.2**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.payments[*].status must be present in the payload
		  - **condition A.2**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.payments[*].type must be present in the payload
		  - **condition A.2**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be present in the payload
		  - **condition A.2**: every element of $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
		
		- **condition A**: $.message.order.cancellation_terms[*].reason_required must be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].state.descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.tags[*].descriptor.code must be in ["BPP_TERMS"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.tags[?(@.descriptor.code=='BPP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO", "FEATURE_LIST"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.items[*].tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT", "FEATURE_LIST"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOURS", "TOTAL_DISTANCE"]
		
		- **condition A**: every element of $.message.order.fulfillments[*].tags[*].descriptor.code must be in ["ROUTE_INFO"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].tags[?(@.descriptor.code=='ROUTE_INFO')].list[*].descriptor.code must be in ["ENCODED_POLYLINE", "WAYPOINTS"]

- **on_confirm** : All the following sub conditions must pass as per the api requirement

	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.location.country.code must be present in the payload
	  - **condition A.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.domain must be present in the payload
	  - **condition A.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition A**: $.context.timestamp must be present in the payload
	
	- **condition A**: $.context.bap_id must be present in the payload
	
	- **condition A**: $.context.transaction_id must be present in the payload
	
	- **condition A**: $.context.message_id must be present in the payload
	
	- **condition A**: $.context.version must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.action must be present in the payload
	  - **condition A.2**: every element of $.context.action must be in ["on_confirm"]
	
	- **condition A**: $.context.bap_uri must be present in the payload
	
	- **condition A**: $.context.ttl must be present in the payload
	
	- **condition A**: $.context.bpp_id must be present in the payload
	
	- **condition A**: $.context.bpp_uri must be present in the payload
	
	- **on_confirm_Message_TESTS** : All the following sub conditions must pass as per the api requirement
	
		- **condition A**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_ENDED", "RIDE_STARTED"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: every element of ["CLAIMED"] must **not** be in $.message.order.fulfillments[*].stops[*].authorization.status
		
		- **condition A**: $.message.order.payments[*].params.transaction_id must be present in the payload
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]
		
		- **condition A**: $.message.order.items[*].id must be present in the payload
		
		- **condition A**: $.message.order.items[*].descriptor.name must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.items[*].descriptor.code must be present in the payload
		  - **condition A.2**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
		
		- **condition A**: $.message.order.items[*].price.currency must be present in the payload
		
		- **condition A**: $.message.order.items[*].price.value must be present in the payload
		
		- **condition A**: $.message.order.items[*].fulfillment_ids[*] must be present in the payload
		
		- **condition A**: $.message.order.items[*].payment_ids[*] must be present in the payload
		
		- **condition A**: $.message.order.provider.id must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].id must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.fulfillments[*].type must be present in the payload
		  - **condition A.2**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
		
		- **condition A**: $.message.order.fulfillments[*].customer.person.name must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].customer.contact.phone must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.fulfillments[*].state.descriptor.code must be present in the payload
		  - **condition A.2**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
		
		- **condition A**: $.message.order.fulfillments[*].type must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
		  - **condition A.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
		
		- **condition A**: $.message.order.quote.price.value must be present in the payload
		
		- **condition A**: $.message.order.quote.price.currency must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.quote.breakup[*].title must be present in the payload
		  - **condition A.2**: every element of $.message.order.quote.breakup[*].title must be in ["BASE_FARE", "DISTANCE_FARE", "CANCELLATION_CHARGES", "REFUND", "TOLL_CHARGES", "PARKING_CHARGES", "TAX", "WAITING_CHARGES", "DRIVER_BATA", "NIGHT_CHARGES", "ADD_ONS"]
		
		- **condition A**: $.message.order.quote.breakup[*].price.currency must be present in the payload
		
		- **condition A**: $.message.order.quote.breakup[*].price.value must be present in the payload
		
		- **condition A**: $.message.order.payments[*].id must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.payments[*].collected_by must be present in the payload
		  - **condition A.2**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.payments[*].status must be present in the payload
		  - **condition A.2**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.payments[*].type must be present in the payload
		  - **condition A.2**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be present in the payload
		  - **condition A.2**: every element of $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
		
		- **condition A**: $.message.order.cancellation_terms[*].reason_required must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.status must be present in the payload
		  - **condition A.2**: every element of $.message.order.status must be in ["UPDATED", "SOFT_CANCEL", "CONFIRM_CANCEL", "ACTIVE", "COMPLETE", "CANCELLED", "CONFIRM_UPDATE", "SOFT_UPDATE"]
		
		- **condition A**: $.message.order.created_at must be present in the payload
		
		- **condition A**: $.message.order.updated_at must be present in the payload
		
		- **condition A**: $.message.order.id must be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.tags[*].descriptor.code must be in ["BAP_TERMS", "BPP_TERMS"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.tags[?(@.descriptor.code=='BAP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT", "SETTLEMENT_BANK_CODE", "SETTLEMENT_BANK_ACCOUNT_NUMBER", "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS"]
		
		- **condition A**: every element of $.message.order.tags[?(@.descriptor.code=='BPP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO", "FEATURE_LIST"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.items[*].tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT", "FEATURE_LIST"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOURS", "TOTAL_DISTANCE"]
		
		- **condition A**: every element of $.message.order.fulfillments[*].tags[*].descriptor.code must be in ["ROUTE_INFO"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].tags[?(@.descriptor.code=='ROUTE_INFO')].list[*].descriptor.code must be in ["ENCODED_POLYLINE", "WAYPOINTS"]

- **on_cancel** : All the following sub conditions must pass as per the api requirement

	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.location.country.code must be present in the payload
	  - **condition A.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.domain must be present in the payload
	  - **condition A.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition A**: $.context.timestamp must be present in the payload
	
	- **condition A**: $.context.bap_id must be present in the payload
	
	- **condition A**: $.context.transaction_id must be present in the payload
	
	- **condition A**: $.context.message_id must be present in the payload
	
	- **condition A**: $.context.version must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.action must be present in the payload
	  - **condition A.2**: every element of $.context.action must be in ["on_cancel"]
	
	- **condition A**: $.context.bap_uri must be present in the payload
	
	- **condition A**: $.context.ttl must be present in the payload
	
	- **condition A**: $.context.bpp_id must be present in the payload
	
	- **condition A**: $.context.bpp_uri must be present in the payload
	
	- **on_cancel_Message_TESTS** : All the following sub conditions must pass as per the api requirement
	
		- **condition A**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_ENDED", "RIDE_STARTED"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: every element of ["CLAIMED"] must **not** be in $.message.order.fulfillments[*].stops[*].authorization.status
		
		- **condition A**: $.message.order.payments[*].params.transaction_id must be present in the payload
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]
		
		- **condition A**: $.message.order.items[*].id must be present in the payload
		
		- **condition A**: $.message.order.items[*].descriptor.name must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.items[*].descriptor.code must be present in the payload
		  - **condition A.2**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
		
		- **condition A**: $.message.order.items[*].fulfillment_ids[*] must be present in the payload
		
		- **condition A**: $.message.order.items[*].payment_ids[*] must be present in the payload
		
		- **condition A**: $.message.order.items[*].price.currency must be present in the payload
		
		- **condition A**: $.message.order.items[*].price.value must be present in the payload
		
		- **condition A**: $.message.order.provider.id must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].id must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.fulfillments[*].type must be present in the payload
		  - **condition A.2**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
		
		- **condition A**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].customer.person.name must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].customer.contact.phone must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].agent.person.name must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].agent.contact.phone must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].vehicle.registration must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
		  - **condition A.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
		
		- **condition A**: $.message.order.fulfillments[*].vehicle.make must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].vehicle.model must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.fulfillments[*].state.descriptor.code must be present in the payload
		  - **condition A.2**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
		
		- **condition A**: $.message.order.fulfillments[*].type must be present in the payload
		
		- **condition A**: $.message.order.quote.price.value must be present in the payload
		
		- **condition A**: $.message.order.quote.price.currency must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.quote.breakup[*].title must be present in the payload
		  - **condition A.2**: every element of $.message.order.quote.breakup[*].title must be in ["BASE_FARE", "DISTANCE_FARE", "CANCELLATION_CHARGES", "REFUND", "TOLL_CHARGES", "PARKING_CHARGES", "TAX", "WAITING_CHARGES", "DRIVER_BATA", "NIGHT_CHARGES", "BUYER_ADDITIONAL_AMOUNT", "ADD_ONS"]
		
		- **condition A**: $.message.order.quote.breakup[*].price.currency must be present in the payload
		
		- **condition A**: $.message.order.quote.breakup[*].price.value must be present in the payload
		
		- **condition A**: $.message.order.payments[*].id must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.payments[*].type must be present in the payload
		  - **condition A.2**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.payments[*].collected_by must be present in the payload
		  - **condition A.2**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.payments[*].status must be present in the payload
		  - **condition A.2**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
		
		- **condition A**: $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be present in the payload
		
		- **condition A**: $.message.order.cancellation_terms[*].reason_required must be present in the payload
		
		- **condition A**: $.message.order.id must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.status must be present in the payload
		  - **condition A.2**: every element of $.message.order.status must be in ["UPDATED", "SOFT_CANCEL", "CONFIRM_CANCEL", "ACTIVE", "COMPLETE", "CANCELLED", "CONFIRM_UPDATE", "SOFT_UPDATE"]
		
		- **condition A**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.cancellation.cancelled_by must be in ["CONSUMER", "PROVIDER"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.cancellation.cancelled_by must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.cancellation.reason.descriptor.code must be in ["000", "001", "002", "003", "004", "005", "011", "012", "013", "014"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.cancellation.reason.descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.tags[*].descriptor.code must be in ["BAP_TERMS", "BPP_TERMS"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.tags[?(@.descriptor.code=='BAP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT", "SETTLEMENT_BANK_CODE", "SETTLEMENT_BANK_ACCOUNT_NUMBER", "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS"]
		
		- **condition A**: every element of $.message.order.tags[?(@.descriptor.code=='BPP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO", "FEATURE_LIST"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.items[*].tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT", "FEATURE_LIST"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOURS", "TOTAL_DISTANCE"]
		
		- **condition A**: every element of $.message.order.fulfillments[*].tags[*].descriptor.code must be in ["ROUTE_INFO"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].tags[?(@.descriptor.code=='ROUTE_INFO')].list[*].descriptor.code must be in ["ENCODED_POLYLINE", "WAYPOINTS"]

- **on_update** : All the following sub conditions must pass as per the api requirement

	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.location.country.code must be present in the payload
	  - **condition A.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.domain must be present in the payload
	  - **condition A.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition A**: $.context.timestamp must be present in the payload
	
	- **condition A**: $.context.bap_id must be present in the payload
	
	- **condition A**: $.context.transaction_id must be present in the payload
	
	- **condition A**: $.context.message_id must be present in the payload
	
	- **condition A**: $.context.version must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.action must be present in the payload
	  - **condition A.2**: every element of $.context.action must be in ["on_update"]
	
	- **condition A**: $.context.bap_uri must be present in the payload
	
	- **condition A**: $.context.ttl must be present in the payload
	
	- **condition A**: $.context.bpp_id must be present in the payload
	
	- **condition A**: $.context.bpp_uri must be present in the payload
	
	- **on_update_Message_TESTS** : All the following sub conditions must pass as per the api requirement
	
		- **condition A**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_ENDED", "RIDE_STARTED"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: every element of ["CLAIMED"] must **not** be in $.message.order.fulfillments[*].stops[*].authorization.status
		
		- **condition A**: $.message.order.payments[*].params.transaction_id must be present in the payload
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]
		
		- **condition A**: $.message.order.items[*].id must be present in the payload
		
		- **condition A**: $.message.order.items[*].descriptor.name must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.items[*].descriptor.code must be present in the payload
		  - **condition A.2**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
		
		- **condition A**: $.message.order.items[*].price.currency must be present in the payload
		
		- **condition A**: $.message.order.items[*].price.value must be present in the payload
		
		- **condition A**: $.message.order.items[*].fulfillment_ids[*] must be present in the payload
		
		- **condition A**: $.message.order.items[*].payment_ids[*] must be present in the payload
		
		- **condition A**: $.message.order.provider.id must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].id must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.fulfillments[*].type must be present in the payload
		  - **condition A.2**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
		
		- **condition A**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
		  - **condition A.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
		
		- **condition A**: $.message.order.fulfillments[*].vehicle.registration must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].customer.person.name must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].customer.contact.phone must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].agent.person.name must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].agent.contact.phone must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].type must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.fulfillments[*].state.descriptor.code must be present in the payload
		  - **condition A.2**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
		
		- **condition A**: $.message.order.quote.price.value must be present in the payload
		
		- **condition A**: $.message.order.quote.price.currency must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.quote.breakup[*].title must be present in the payload
		  - **condition A.2**: every element of $.message.order.quote.breakup[*].title must be in ["BASE_FARE", "DISTANCE_FARE", "CANCELLATION_CHARGES", "REFUND", "TOLL_CHARGES", "PARKING_CHARGES", "TAX", "WAITING_CHARGES", "DRIVER_BATA", "NIGHT_CHARGES", "BUYER_ADDITIONAL_AMOUNT", "ADD_ONS"]
		
		- **condition A**: $.message.order.quote.breakup[*].price.currency must be present in the payload
		
		- **condition A**: $.message.order.quote.breakup[*].price.value must be present in the payload
		
		- **condition A**: $.message.order.payments[*].id must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.payments[*].collected_by must be present in the payload
		  - **condition A.2**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.payments[*].status must be present in the payload
		  - **condition A.2**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.payments[*].type must be present in the payload
		  - **condition A.2**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
		
		- **condition A**: $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be present in the payload
		
		- **condition A**: $.message.order.cancellation_terms[*].reason_required must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.status must be present in the payload
		  - **condition A.2**: every element of $.message.order.status must be in ["UPDATED", "SOFT_CANCEL", "CONFIRM_CANCEL", "ACTIVE", "COMPLETE", "CANCELLED", "CONFIRM_UPDATE", "SOFT_UPDATE"]
		
		- **condition A**: $.message.order.created_at must be present in the payload
		
		- **condition A**: $.message.order.updated_at must be present in the payload
		
		- **condition A**: $.message.order.id must be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.tags[*].descriptor.code must be in ["BAP_TERMS", "BPP_TERMS"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.tags[?(@.descriptor.code=='BAP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT", "SETTLEMENT_BANK_CODE", "SETTLEMENT_BANK_ACCOUNT_NUMBER", "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS"]
		
		- **condition A**: every element of $.message.order.tags[?(@.descriptor.code=='BPP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO", "FEATURE_LIST"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.items[*].tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT", "FEATURE_LIST"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOURS", "TOTAL_DISTANCE"]
		
		- **condition A**: every element of $.message.order.fulfillments[*].tags[*].descriptor.code must be in ["ROUTE_INFO"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].tags[?(@.descriptor.code=='ROUTE_INFO')].list[*].descriptor.code must be in ["ENCODED_POLYLINE", "WAYPOINTS"]

- **on_status** : All the following sub conditions must pass as per the api requirement

	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.location.country.code must be present in the payload
	  - **condition A.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.domain must be present in the payload
	  - **condition A.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition A**: $.context.timestamp must be present in the payload
	
	- **condition A**: $.context.bap_id must be present in the payload
	
	- **condition A**: $.context.transaction_id must be present in the payload
	
	- **condition A**: $.context.message_id must be present in the payload
	
	- **condition A**: $.context.version must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.action must be present in the payload
	  - **condition A.2**: every element of $.context.action must be in ["on_status"]
	
	- **condition A**: $.context.bap_uri must be present in the payload
	
	- **condition A**: $.context.ttl must be present in the payload
	
	- **condition A**: $.context.bpp_id must be present in the payload
	
	- **condition A**: $.context.bpp_uri must be present in the payload
	
	- **on_status_Message_TESTS** : All the following sub conditions must pass as per the api requirement
	
		- **condition A**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_ENDED", "RIDE_STARTED"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: every element of ["CLAIMED"] must **not** be in $.message.order.fulfillments[*].stops[*].authorization.status
		
		- **condition A**: $.message.order.payments[*].params.transaction_id must be present in the payload
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]
		
		- **condition A**: $.message.order.items[*].id must be present in the payload
		
		- **condition A**: $.message.order.items[*].descriptor.name must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.items[*].descriptor.code must be present in the payload
		  - **condition A.2**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]
		
		- **condition A**: $.message.order.items[*].price.currency must be present in the payload
		
		- **condition A**: $.message.order.items[*].price.value must be present in the payload
		
		- **condition A**: $.message.order.items[*].fulfillment_ids[*] must be present in the payload
		
		- **condition A**: $.message.order.items[*].payment_ids[*] must be present in the payload
		
		- **condition A**: $.message.order.provider.id must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].id must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.fulfillments[*].type must be present in the payload
		  - **condition A.2**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]
		
		- **condition A**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
		  - **condition A.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]
		
		- **condition A**: $.message.order.fulfillments[*].vehicle.registration must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].customer.person.name must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].customer.contact.phone must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].agent.person.name must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].agent.contact.phone must be present in the payload
		
		- **condition A**: $.message.order.fulfillments[*].type must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.fulfillments[*].state.descriptor.code must be present in the payload
		  - **condition A.2**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
		
		- **condition A**: $.message.order.quote.price.value must be present in the payload
		
		- **condition A**: $.message.order.quote.price.currency must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.quote.breakup[*].title must be present in the payload
		  - **condition A.2**: every element of $.message.order.quote.breakup[*].title must be in ["BASE_FARE", "DISTANCE_FARE", "CANCELLATION_CHARGES", "REFUND", "TOLL_CHARGES", "PARKING_CHARGES", "TAX", "WAITING_CHARGES", "DRIVER_BATA", "NIGHT_CHARGES", "BUYER_ADDITIONAL_AMOUNT", "ADD_ONS"]
		
		- **condition A**: $.message.order.quote.breakup[*].price.currency must be present in the payload
		
		- **condition A**: $.message.order.quote.breakup[*].price.value must be present in the payload
		
		- **condition A**: $.message.order.payments[*].id must be present in the payload
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.payments[*].collected_by must be present in the payload
		  - **condition A.2**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.payments[*].status must be present in the payload
		  - **condition A.2**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.payments[*].type must be present in the payload
		  - **condition A.2**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]
		
		- **condition A**: all of the following sub conditions must be met:
		
		  - **condition A.1**: $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be present in the payload
		  - **condition A.2**: every element of $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]
		
		- **condition A**: $.message.order.cancellation_terms[*].reason_required must be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.status must be in ["SOFT_CANCEL", "CONFIRM_CANCEL", "ACTIVE", "COMPLETE", "CANCELLED", "CONFIRM_UPDATE", "UPDATED", "SOFT_UPDATE"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.status must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.tags[*].descriptor.code must be in ["BAP_TERMS", "BPP_TERMS"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.tags[?(@.descriptor.code=='BAP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT", "SETTLEMENT_BANK_CODE", "SETTLEMENT_BANK_ACCOUNT_NUMBER", "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS"]
		
		- **condition A**: every element of $.message.order.tags[?(@.descriptor.code=='BPP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO", "FEATURE_LIST"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.items[*].tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT", "FEATURE_LIST"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]
		
		- **condition A**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOURS", "TOTAL_DISTANCE"]
		
		- **condition A**: every element of $.message.order.fulfillments[*].tags[*].descriptor.code must be in ["ROUTE_INFO"]
		
			> Note: **Condition A** can be skipped if the following conditions are met:
			>
			> - **condition B**: $.message.order.fulfillments[*].tags[*].descriptor.code must **not** be present in the payload
		
		- **condition A**: every element of $.message.order.fulfillments[*].tags[?(@.descriptor.code=='ROUTE_INFO')].list[*].descriptor.code must be in ["ENCODED_POLYLINE", "WAYPOINTS"]

- **track** : All the following sub conditions must pass as per the api requirement

	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.location.country.code must be present in the payload
	  - **condition A.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.domain must be present in the payload
	  - **condition A.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition A**: $.context.timestamp must be present in the payload
	
	- **condition A**: $.context.bap_id must be present in the payload
	
	- **condition A**: $.context.transaction_id must be present in the payload
	
	- **condition A**: $.context.message_id must be present in the payload
	
	- **condition A**: $.context.version must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.action must be present in the payload
	  - **condition A.2**: every element of $.context.action must be in ["track"]
	
	- **condition A**: $.context.bap_uri must be present in the payload
	
	- **condition A**: $.context.ttl must be present in the payload
	
	- **condition A**: $.context.bpp_id must be present in the payload
	
	- **condition A**: $.context.bpp_uri must be present in the payload

- **on_track** : All the following sub conditions must pass as per the api requirement

	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.location.country.code must be present in the payload
	  - **condition A.2**: every element of $.context.location.country.code must be in ["IND"]
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.domain must be present in the payload
	  - **condition A.2**: every element of $.context.domain must be in ["ONDC:TRV10"]
	
	- **condition A**: $.context.timestamp must be present in the payload
	
	- **condition A**: $.context.bap_id must be present in the payload
	
	- **condition A**: $.context.transaction_id must be present in the payload
	
	- **condition A**: $.context.message_id must be present in the payload
	
	- **condition A**: $.context.version must be present in the payload
	
	- **condition A**: all of the following sub conditions must be met:
	
	  - **condition A.1**: $.context.action must be present in the payload
	  - **condition A.2**: every element of $.context.action must be in ["on_track"]
	
	- **condition A**: $.context.bap_uri must be present in the payload
	
	- **condition A**: $.context.ttl must be present in the payload
	
	- **condition A**: $.context.bpp_id must be present in the payload
	
	- **condition A**: $.context.bpp_uri must be present in the payload
	
	- **on_track_Message_TESTS** : All the following sub conditions must pass as per the api requirement
	
		