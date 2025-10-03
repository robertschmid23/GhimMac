//
//  Test.swift
//  GhimMac
//
//  Created by Robert Schmid on 10/2/2025.
//

import Testing
import GhimMac

struct Test
{		
	@Test func testLog() async throws {
		Log.debug("Debug Statement")
		Log.info("Info Statement")
		Log.warn("Warn Statement")
		Log.error("Error Statement")
//		Log.markTimerStart(msg: "Start Timer")
//		Log.markTime(msg: "Check Lap")
//		Log.markTimerEnd(msg: "End Timer")
	}
}
