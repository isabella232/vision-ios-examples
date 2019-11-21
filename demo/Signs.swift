import Foundation
import MapboxVision

// swiftlint:disable cyclomatic_complexity file_length

extension Sign {
    func icon(over: Bool, country: Country) -> ImageAsset? {
        let asset = getIcon(over, country)
        assert(asset != nil || country == .unknown, "Icon for \(self) with over: \(over) for country: \(country.rawValue) is not found")
        return asset
    }

    // swiftlint:disable:next function_body_length
    private func getIcon(_ over: Bool, _ country: Country) -> ImageAsset? {
        switch country {
        case .USA:
            switch type {
            case .unknown:
                return nil
            case .mass:
                return nil
            case .speedLimit:
                switch number {
                case 5:
                    return over ? Asset.Signs.speedLimitUS5Over : Asset.Signs.speedLimitUS5
                case 15:
                    return over ? Asset.Signs.speedLimitUS15Over : Asset.Signs.speedLimitUS15
                case 25:
                    return over ? Asset.Signs.speedLimitUS25Over : Asset.Signs.speedLimitUS25
                case 35:
                    return over ? Asset.Signs.speedLimitUS35Over : Asset.Signs.speedLimitUS35
                case 45:
                    return over ? Asset.Signs.speedLimitUS45Over : Asset.Signs.speedLimitUS45
                case 55:
                    return over ? Asset.Signs.speedLimitUS55Over : Asset.Signs.speedLimitUS55
                case 65:
                    return over ? Asset.Signs.speedLimitUS65Over : Asset.Signs.speedLimitUS65
                case 75:
                    return over ? Asset.Signs.speedLimitUS75Over : Asset.Signs.speedLimitUS75
                case 10:
                    return over ? Asset.Signs.speedLimitUS10Over : Asset.Signs.speedLimitUS10
                case 20:
                    return over ? Asset.Signs.speedLimitUS20Over : Asset.Signs.speedLimitUS20
                case 30:
                    return over ? Asset.Signs.speedLimitUS30Over : Asset.Signs.speedLimitUS30
                case 40:
                    return over ? Asset.Signs.speedLimitUS40Over : Asset.Signs.speedLimitUS40
                case 50:
                    return over ? Asset.Signs.speedLimitUS50Over : Asset.Signs.speedLimitUS50
                case 60:
                    return over ? Asset.Signs.speedLimitUS60Over : Asset.Signs.speedLimitUS60
                case 70:
                    return over ? Asset.Signs.speedLimitUS70Over : Asset.Signs.speedLimitUS70
                case 80:
                    return over ? Asset.Signs.speedLimitUS80Over : Asset.Signs.speedLimitUS80
                case 85:
                    return over ? Asset.Signs.speedLimitUS85Over : Asset.Signs.speedLimitUS85
                case 90:
                    return over ? Asset.Signs.speedLimitUS90Over : Asset.Signs.speedLimitUS90
                default: return nil
                }
            case .speedLimitEnd:
                switch number {
                case 5:
                    return Asset.Signs.speedLimitEndUS5
                case 15:
                    return Asset.Signs.speedLimitEndUS15
                case 25:
                    return Asset.Signs.speedLimitEndUS25
                case 35:
                    return Asset.Signs.speedLimitEndUS35
                case 45:
                    return Asset.Signs.speedLimitEndUS45
                case 55:
                    return Asset.Signs.speedLimitEndUS55
                case 65:
                    return Asset.Signs.speedLimitEndUS65
                case 75:
                    return Asset.Signs.speedLimitEndUS75
                case 10:
                    return Asset.Signs.speedLimitEndUS10
                case 20:
                    return Asset.Signs.speedLimitEndUS20
                case 30:
                    return Asset.Signs.speedLimitEndUS30
                case 40:
                    return Asset.Signs.speedLimitEndUS40
                case 50:
                    return Asset.Signs.speedLimitEndUS50
                case 60:
                    return Asset.Signs.speedLimitEndUS60
                case 70:
                    return Asset.Signs.speedLimitEndUS70
                case 80:
                    return Asset.Signs.speedLimitEndUS80
                case 85:
                    return Asset.Signs.speedLimitEndUS85
                case 90:
                    return Asset.Signs.speedLimitEndUS90
                default: return nil
                }
            case .speedLimitMin:
                switch number {
                case 5:
                    return over ? Asset.Signs.speedLimitMinUS5Over : Asset.Signs.speedLimitMinUS5
                case 15:
                    return over ? Asset.Signs.speedLimitMinUS15Over : Asset.Signs.speedLimitMinUS15
                case 25:
                    return over ? Asset.Signs.speedLimitMinUS25Over : Asset.Signs.speedLimitMinUS25
                case 35:
                    return over ? Asset.Signs.speedLimitMinUS35Over : Asset.Signs.speedLimitMinUS35
                case 45:
                    return over ? Asset.Signs.speedLimitMinUS45Over : Asset.Signs.speedLimitMinUS45
                case 55:
                    return over ? Asset.Signs.speedLimitMinUS55Over : Asset.Signs.speedLimitMinUS55
                case 65:
                    return over ? Asset.Signs.speedLimitMinUS65Over : Asset.Signs.speedLimitMinUS65
                case 75:
                    return over ? Asset.Signs.speedLimitMinUS75Over : Asset.Signs.speedLimitMinUS75
                case 10:
                    return over ? Asset.Signs.speedLimitMinUS10Over : Asset.Signs.speedLimitMinUS10
                case 20:
                    return over ? Asset.Signs.speedLimitMinUS20Over : Asset.Signs.speedLimitMinUS20
                case 30:
                    return over ? Asset.Signs.speedLimitMinUS30Over : Asset.Signs.speedLimitMinUS30
                case 40:
                    return over ? Asset.Signs.speedLimitMinUS40Over : Asset.Signs.speedLimitMinUS40
                case 50:
                    return over ? Asset.Signs.speedLimitMinUS50Over : Asset.Signs.speedLimitMinUS50
                case 60:
                    return over ? Asset.Signs.speedLimitMinUS60Over : Asset.Signs.speedLimitMinUS60
                case 70:
                    return over ? Asset.Signs.speedLimitMinUS70Over : Asset.Signs.speedLimitMinUS70
                case 80:
                    return over ? Asset.Signs.speedLimitMinUS80Over : Asset.Signs.speedLimitMinUS80
                case 85:
                    return over ? Asset.Signs.speedLimitMinUS85Over : Asset.Signs.speedLimitMinUS85
                case 90:
                    return over ? Asset.Signs.speedLimitMinUS90Over : Asset.Signs.speedLimitMinUS90
                default: return nil
                }
            case .speedLimitTrucks:
                switch number {
                case 5:
                    return over ? Asset.Signs.speedLimitTrucksUS5Over : Asset.Signs.speedLimitTrucksUS5
                case 15:
                    return over ? Asset.Signs.speedLimitTrucksUS15Over : Asset.Signs.speedLimitTrucksUS15
                case 25:
                    return over ? Asset.Signs.speedLimitTrucksUS25Over : Asset.Signs.speedLimitTrucksUS25
                case 35:
                    return over ? Asset.Signs.speedLimitTrucksUS35Over : Asset.Signs.speedLimitTrucksUS35
                case 45:
                    return over ? Asset.Signs.speedLimitTrucksUS45Over : Asset.Signs.speedLimitTrucksUS45
                case 55:
                    return over ? Asset.Signs.speedLimitTrucksUS55Over : Asset.Signs.speedLimitTrucksUS55
                case 65:
                    return over ? Asset.Signs.speedLimitTrucksUS65Over : Asset.Signs.speedLimitTrucksUS65
                case 75:
                    return over ? Asset.Signs.speedLimitTrucksUS75Over : Asset.Signs.speedLimitTrucksUS75
                case 10:
                    return over ? Asset.Signs.speedLimitTrucksUS10Over : Asset.Signs.speedLimitTrucksUS10
                case 20:
                    return over ? Asset.Signs.speedLimitTrucksUS20Over : Asset.Signs.speedLimitTrucksUS20
                case 30:
                    return over ? Asset.Signs.speedLimitTrucksUS30Over : Asset.Signs.speedLimitTrucksUS30
                case 40:
                    return over ? Asset.Signs.speedLimitTrucksUS40Over : Asset.Signs.speedLimitTrucksUS40
                case 50:
                    return over ? Asset.Signs.speedLimitTrucksUS50Over : Asset.Signs.speedLimitTrucksUS50
                case 60:
                    return over ? Asset.Signs.speedLimitTrucksUS60Over : Asset.Signs.speedLimitTrucksUS60
                case 70:
                    return over ? Asset.Signs.speedLimitTrucksUS70Over : Asset.Signs.speedLimitTrucksUS70
                case 80:
                    return over ? Asset.Signs.speedLimitTrucksUS80Over : Asset.Signs.speedLimitTrucksUS80
                case 85:
                    return over ? Asset.Signs.speedLimitTrucksUS85Over : Asset.Signs.speedLimitTrucksUS85
                case 90:
                    return over ? Asset.Signs.speedLimitTrucksUS90Over : Asset.Signs.speedLimitTrucksUS90
                default: return nil
                }
            case .speedLimitNight:
                switch number {
                case 5:
                    return over ? Asset.Signs.speedLimitNightUS5Over : Asset.Signs.speedLimitNightUS5
                case 15:
                    return over ? Asset.Signs.speedLimitNightUS15Over : Asset.Signs.speedLimitNightUS15
                case 25:
                    return over ? Asset.Signs.speedLimitNightUS25Over : Asset.Signs.speedLimitNightUS25
                case 35:
                    return over ? Asset.Signs.speedLimitNightUS35Over : Asset.Signs.speedLimitNightUS35
                case 45:
                    return over ? Asset.Signs.speedLimitNightUS45Over : Asset.Signs.speedLimitNightUS45
                case 55:
                    return over ? Asset.Signs.speedLimitNightUS55Over : Asset.Signs.speedLimitNightUS55
                case 65:
                    return over ? Asset.Signs.speedLimitNightUS65Over : Asset.Signs.speedLimitNightUS65
                case 75:
                    return over ? Asset.Signs.speedLimitNightUS75Over : Asset.Signs.speedLimitNightUS75
                case 10:
                    return over ? Asset.Signs.speedLimitNightUS10Over : Asset.Signs.speedLimitNightUS10
                case 20:
                    return over ? Asset.Signs.speedLimitNightUS20Over : Asset.Signs.speedLimitNightUS20
                case 30:
                    return over ? Asset.Signs.speedLimitNightUS30Over : Asset.Signs.speedLimitNightUS30
                case 40:
                    return over ? Asset.Signs.speedLimitNightUS40Over : Asset.Signs.speedLimitNightUS40
                case 50:
                    return over ? Asset.Signs.speedLimitNightUS50Over : Asset.Signs.speedLimitNightUS50
                case 60:
                    return over ? Asset.Signs.speedLimitNightUS60Over : Asset.Signs.speedLimitNightUS60
                case 70:
                    return over ? Asset.Signs.speedLimitNightUS70Over : Asset.Signs.speedLimitNightUS70
                case 80:
                    return over ? Asset.Signs.speedLimitNightUS80Over : Asset.Signs.speedLimitNightUS80
                case 85:
                    return over ? Asset.Signs.speedLimitNightUS85Over : Asset.Signs.speedLimitNightUS85
                case 90:
                    return over ? Asset.Signs.speedLimitNightUS90Over : Asset.Signs.speedLimitNightUS90
                default: return nil
                }
            case .speedLimitComplementary:
                switch number {
                case 5:
                    return over ? Asset.Signs.speedLimitCompUS5Over : Asset.Signs.speedLimitCompUS5
                case 15:
                    return over ? Asset.Signs.speedLimitCompUS15Over : Asset.Signs.speedLimitCompUS15
                case 25:
                    return over ? Asset.Signs.speedLimitCompUS25Over : Asset.Signs.speedLimitCompUS25
                case 35:
                    return over ? Asset.Signs.speedLimitCompUS35Over : Asset.Signs.speedLimitCompUS35
                case 45:
                    return over ? Asset.Signs.speedLimitCompUS45Over : Asset.Signs.speedLimitCompUS45
                case 55:
                    return over ? Asset.Signs.speedLimitCompUS55Over : Asset.Signs.speedLimitCompUS55
                case 65:
                    return over ? Asset.Signs.speedLimitCompUS65Over : Asset.Signs.speedLimitCompUS65
                case 75:
                    return over ? Asset.Signs.speedLimitCompUS75Over : Asset.Signs.speedLimitCompUS75
                case 85:
                    return over ? Asset.Signs.speedLimitCompUS85Over : Asset.Signs.speedLimitCompUS85
                case 10:
                    return over ? Asset.Signs.speedLimitCompUS10Over : Asset.Signs.speedLimitCompUS10
                case 20:
                    return over ? Asset.Signs.speedLimitCompUS20Over : Asset.Signs.speedLimitCompUS20
                case 30:
                    return over ? Asset.Signs.speedLimitCompUS30Over : Asset.Signs.speedLimitCompUS30
                case 40:
                    return over ? Asset.Signs.speedLimitCompUS40Over : Asset.Signs.speedLimitCompUS40
                case 50:
                    return over ? Asset.Signs.speedLimitCompUS50Over : Asset.Signs.speedLimitCompUS50
                case 60:
                    return over ? Asset.Signs.speedLimitCompUS60Over : Asset.Signs.speedLimitCompUS60
                case 70:
                    return over ? Asset.Signs.speedLimitCompUS70Over : Asset.Signs.speedLimitCompUS70
                case 80:
                    return over ? Asset.Signs.speedLimitCompUS80Over : Asset.Signs.speedLimitCompUS80
                case 90:
                    return over ? Asset.Signs.speedLimitCompUS90Over : Asset.Signs.speedLimitCompUS90
                default: return nil
                }
            case .speedLimitExit:
                switch number {
                case 5:
                    return over ? Asset.Signs.warningExitUS5Over : Asset.Signs.warningExitUS5
                case 15:
                    return over ? Asset.Signs.warningExitUS15Over : Asset.Signs.warningExitUS15
                case 25:
                    return over ? Asset.Signs.warningExitUS25Over : Asset.Signs.warningExitUS25
                case 35:
                    return over ? Asset.Signs.warningExitUS35Over : Asset.Signs.warningExitUS35
                case 45:
                    return over ? Asset.Signs.warningExitUS45Over : Asset.Signs.warningExitUS45
                case 55:
                    return over ? Asset.Signs.warningExitUS55Over : Asset.Signs.warningExitUS55
                case 65:
                    return over ? Asset.Signs.warningExitUS65Over : Asset.Signs.warningExitUS65
                case 75:
                    return over ? Asset.Signs.warningExitUS75Over : Asset.Signs.warningExitUS75
                case 85:
                    return over ? Asset.Signs.warningExitUS85Over : Asset.Signs.warningExitUS85
                case 10:
                    return over ? Asset.Signs.warningExitUS10Over : Asset.Signs.warningExitUS10
                case 20:
                    return over ? Asset.Signs.warningExitUS20Over : Asset.Signs.warningExitUS20
                case 30:
                    return over ? Asset.Signs.warningExitUS30Over : Asset.Signs.warningExitUS30
                case 40:
                    return over ? Asset.Signs.warningExitUS40Over : Asset.Signs.warningExitUS40
                case 50:
                    return over ? Asset.Signs.warningExitUS50Over : Asset.Signs.warningExitUS50
                case 60:
                    return over ? Asset.Signs.warningExitUS60Over : Asset.Signs.warningExitUS60
                case 70:
                    return over ? Asset.Signs.warningExitUS70Over : Asset.Signs.warningExitUS70
                case 80:
                    return over ? Asset.Signs.warningExitUS80Over : Asset.Signs.warningExitUS80
                case 90:
                    return over ? Asset.Signs.warningExitUS90Over : Asset.Signs.warningExitUS90
                default: return nil
                }
            case .speedLimitRamp:
                switch number {
                case 5:
                    return over ? Asset.Signs.warningRampUS5Over : Asset.Signs.warningRampUS5
                case 15:
                    return over ? Asset.Signs.warningRampUS15Over : Asset.Signs.warningRampUS15
                case 25:
                    return over ? Asset.Signs.warningRampUS25Over : Asset.Signs.warningRampUS25
                case 35:
                    return over ? Asset.Signs.warningRampUS35Over : Asset.Signs.warningRampUS35
                case 45:
                    return over ? Asset.Signs.warningRampUS45Over : Asset.Signs.warningRampUS45
                case 55:
                    return over ? Asset.Signs.warningRampUS55Over : Asset.Signs.warningRampUS55
                case 65:
                    return over ? Asset.Signs.warningRampUS65Over : Asset.Signs.warningRampUS65
                case 75:
                    return over ? Asset.Signs.warningRampUS75Over : Asset.Signs.warningRampUS75
                case 85:
                    return over ? Asset.Signs.warningRampUS85Over : Asset.Signs.warningRampUS85
                case 10:
                    return over ? Asset.Signs.warningRampUS10Over : Asset.Signs.warningRampUS10
                case 20:
                    return over ? Asset.Signs.warningRampUS20Over : Asset.Signs.warningRampUS20
                case 30:
                    return over ? Asset.Signs.warningRampUS30Over : Asset.Signs.warningRampUS30
                case 40:
                    return over ? Asset.Signs.warningRampUS40Over : Asset.Signs.warningRampUS40
                case 50:
                    return over ? Asset.Signs.warningRampUS50Over : Asset.Signs.warningRampUS50
                case 60:
                    return over ? Asset.Signs.warningRampUS60Over : Asset.Signs.warningRampUS60
                case 70:
                    return over ? Asset.Signs.warningRampUS70Over : Asset.Signs.warningRampUS70
                case 80:
                    return over ? Asset.Signs.warningRampUS80Over : Asset.Signs.warningRampUS80
                case 90:
                    return over ? Asset.Signs.warningRampUS90Over : Asset.Signs.warningRampUS90
                default: return nil
                }
            case .warningTurnLeft:
                return Asset.Signs.warningTurnLeftUS
            case .warningTurnRight:
                return Asset.Signs.warningTurnRightUS
            case .warningHairpinCurveLeft:
                return Asset.Signs.warningHairpinCurveLeftUS
            case .warningRoundabout:
                return Asset.Signs.warningRoundaboutUS
            case .warningSpeedBump:
                return Asset.Signs.warningSpeedBumpUS
            case .warningWindingRoad:
                return Asset.Signs.warningWindingRoadUS
            case .informationBikeRoute:
                return Asset.Signs.informationBikeRouteUS
            case .informationParking:
                return Asset.Signs.informationParkingUS
            case .regulatoryAllDirectionsPermitted:
                return Asset.Signs.regulatoryAllDirectionsPermittedUS
            case .regulatoryBicyclesOnly:
                return Asset.Signs.regulatoryBicyclesOnlyUS
            case .regulatoryDoNotPass:
                return Asset.Signs.regulatoryDoNotPassUS
            case .regulatoryDoNotDriveOnShoulder:
                return Asset.Signs.regulatoryDoNotDriveOnShoulderUS
            case .regulatoryDualLanesAllDirectionsOnRight:
                return Asset.Signs.regulatoryDualLanesAllDirectionsOnRightUS
            case .regulatoryDualLanesGoLeftOrRight:
                return Asset.Signs.regulatoryDualLanesGoLeftOrRightUS
            case .regulatoryDualLanesGoStraightOnLeft:
                return Asset.Signs.regulatoryDualLanesGoStraightOnLeftUS
            case .regulatoryDualLanesGoStraightOnRight:
                return Asset.Signs.regulatoryDualLanesGoStraightOnRightUS
            case .regulatoryDualLanesTurnLeft:
                return Asset.Signs.regulatoryDualLanesTurnLeftUS
            case .regulatoryDualLanesTurnLeftOrStraight:
                return Asset.Signs.regulatoryDualLanesTurnLeftOrStraightUS
            case .regulatoryDualLanesTurnRightOrStraight:
                return Asset.Signs.regulatoryDualLanesTurnRightOrStraightUS
            case .regulatoryEndOfSchoolZone:
                return Asset.Signs.regulatoryEndOfSchoolZoneUS
            case .regulatoryGoStraight:
                return Asset.Signs.regulatoryGoStraightUS
            case .regulatoryGoStraightOrTurnLeft:
                return Asset.Signs.regulatoryGoStraightOrTurnLeftUS
            case .regulatoryGoStraightOrTurnRight:
                return Asset.Signs.regulatoryGoStraightOrTurnRightUS
            case .regulatoryHeightLimit:
                return Asset.Signs.regulatoryHeightLimitUS
            case .regulatoryLeftTurnYieldOnGreen:
                return Asset.Signs.regulatoryLeftTurnYieldOnGreenUS
            case .regulatoryNoBicycles:
                return Asset.Signs.regulatoryNoBicyclesUS
            case .regulatoryNoEntry:
                return Asset.Signs.regulatoryNoEntryUS
            case .regulatoryNoLeftOrUTurn:
                return Asset.Signs.regulatoryNoLeftOrUTurnUS
            case .regulatoryNoLeftTurn:
                return Asset.Signs.regulatoryNoLeftTurnUS
            case .regulatoryNoMotorVehicles:
                return Asset.Signs.regulatoryNoMotorVehiclesUS
            case .regulatoryNoParking:
                return Asset.Signs.regulatoryNoParkingUS
            case .regulatoryNoParkingOrNoStopping:
                return Asset.Signs.regulatoryNoParkingOrNoStoppingUS
            case .regulatoryNoPedestrians:
                return Asset.Signs.regulatoryNoPedestriansUS
            case .regulatoryNoRightTurn:
                return Asset.Signs.regulatoryNoRightTurnUS
            case .regulatoryNoStopping:
                return Asset.Signs.regulatoryNoStoppingUS
            case .regulatoryNoStraightThrough:
                return Asset.Signs.regulatoryNoStraightThroughUS
            case .regulatoryNoUTurn:
                return Asset.Signs.regulatoryNoUTurnUS
            case .regulatoryOneWayStraight:
                return Asset.Signs.regulatoryOneWayStraightUS
            case .regulatoryReversibleLanes:
                return Asset.Signs.regulatoryReversibleLanesUS
            case .regulatoryRoadClosedToVehicles:
                return Asset.Signs.regulatoryRoadClosedToVehiclesUS
            case .regulatoryStop:
                return Asset.Signs.regulatoryStopUS
            case .regulatoryTrafficSignalPhotoEnforced:
                return Asset.Signs.regulatoryTrafficSignalPhotoEnforcedUS
            case .regulatoryTripleLanesGoStraightCenterLane:
                return Asset.Signs.regulatoryTripleLanesGoStraightCenterLaneUS
            case .warningBicyclesCrossing:
                return Asset.Signs.warningBicyclesCrossingUS
            case .warningHeightRestriction:
                return Asset.Signs.warningHeightRestrictionUS
            case .warningPassLeftOrRight:
                return Asset.Signs.warningPassLeftOrRightUS
            case .warningPedestriansCrossing:
                return Asset.Signs.warningPedestriansCrossingUS
            case .warningRoadNarrowsLeft:
                return Asset.Signs.warningRoadNarrowsLeftUS
            case .warningRoadNarrowsRight:
                return Asset.Signs.warningRoadNarrowsRightUS
            case .warningSchoolZone:
                return Asset.Signs.warningSchoolZoneUS
            case .warningStopAhead:
                return Asset.Signs.warningStopAheadUS
            case .warningTrafficSignals:
                return Asset.Signs.warningTrafficSignalsUS
            case .warningTwoWayTraffic:
                return Asset.Signs.warningTwoWayTrafficUS
            case .warningYieldAhead:
                return Asset.Signs.warningYieldAheadUS
            case .informationHighway:
                return Asset.Signs.informationHighwayUS
            case .regulatoryDoNotBlockIntersection:
                return Asset.Signs.regulatoryDoNotBlockIntersectionUS
            case .regulatoryKeepRightPicture:
                return Asset.Signs.regulatoryKeepRightPictureUS
            case .regulatoryKeepRightText:
                return Asset.Signs.regulatoryKeepRightTextUS
            case .regulatoryNoHeavyGoodsVehiclesPicture:
                return Asset.Signs.regulatoryNoHeavyGoodsVehiclesPictureUS
            case .regulatoryNoLeftTurnText:
                return Asset.Signs.regulatoryNoLeftTurnTextUS
            case .regulatoryOneWayLeftArrow:
                return Asset.Signs.regulatoryOneWayLeftArrowUS
            case .regulatoryOneWayLeftArrowText:
                return Asset.Signs.regulatoryOneWayLeftArrowTextUS
            case .regulatoryOneWayLeftText:
                return Asset.Signs.regulatoryOneWayLeftTextUS
            case .regulatoryOneWayRightArrow:
                return Asset.Signs.regulatoryOneWayRightArrowUS
            case .regulatoryOneWayRightArrowText:
                return Asset.Signs.regulatoryOneWayRightArrowTextUS
            case .regulatoryOneWayRightText:
                return Asset.Signs.regulatoryOneWayRightTextUS
            case .regulatoryTurnLeftAhead:
                return Asset.Signs.regulatoryTurnLeftAheadUS
            case .regulatoryTurnLeft:
                return Asset.Signs.regulatoryTurnLeftUS
            case .regulatoryTurnLeftOrRight:
                return Asset.Signs.regulatoryTurnLeftOrRightUS
            case .regulatoryTurnRightAhead:
                return Asset.Signs.regulatoryTurnRightAheadUS
            case .regulatoryYield:
                return Asset.Signs.regulatoryYieldUS
            case .warningRailwayCrossing:
                return Asset.Signs.warningRailwayCrossingUS
            case .warningHairpinCurveRight:
                return Asset.Signs.warningHairpinCurveRightUS
            case .complementaryOneDirectionLeft:
                return Asset.Signs.complementaryOneDirectionLeftUS
            case .complementaryOneDirectionRight:
                return Asset.Signs.complementaryOneDirectionRightUS
            case .warningCurveLeft:
                return Asset.Signs.warningCurveLeftUS
            case .warningCurveRight:
                return Asset.Signs.warningCurveRightUS
            case .warningHorizontalAlignmentLeft:
                return Asset.Signs.warningHorizontalAlignmentLeftUS
            case .warningHorizontalAlignmentRight:
                return Asset.Signs.warningHorizontalAlignmentRightUS
            case .regulatoryTurnRight:
                return Asset.Signs.regulatoryTurnRightUS
            case .whiteTablesText:
                return Asset.Signs.whiteTablesTextUS
            case .lanes:
                return Asset.Signs.lanesUS
            case .greenPlates:
                return Asset.Signs.greenPlatesUS
            case .warningText:
                return Asset.Signs.warningTextUS
            case .warningCrossroads:
                return Asset.Signs.warningCrossroadsUS
            case .warningPicture:
                return Asset.Signs.warningPictureUS
            case .complementaryKeepLeft:
                return Asset.Signs.complementaryKeepLeftUS
            case .complementaryKeepRight:
                return Asset.Signs.complementaryKeepRightUS
            case .regulatoryExceptBicycle:
                return Asset.Signs.regulatoryExceptBicycleUS
            case .warningAddedLaneRight:
                return Asset.Signs.warningAddedLaneRightUS
            case .warningDeadEndText:
                return Asset.Signs.warningDeadEndTextUS
            case .warningDipText:
                return Asset.Signs.warningDipTextUS
            case .warningEmergencyVehicles:
                return Asset.Signs.warningEmergencyVehiclesUS
            case .warningEndText:
                return Asset.Signs.warningEndTextUS
            case .warningFallingRocksOrDebrisRight:
                return Asset.Signs.warningFallingRocksOrDebrisRightUS
            case .warningLowGroundClearance:
                return Asset.Signs.warningLowGroundClearanceUS
            case .warningObstructionMarker:
                return Asset.Signs.warningObstructionMarkerUS
            case .warningPlayground:
                return Asset.Signs.warningPlaygroundUS
            case .warningSecondRoadRight:
                return Asset.Signs.warningSecondRoadRightUS
            case .warningTurnLeftOnlyArrow:
                return Asset.Signs.warningTurnLeftOnlyArrowUS
            case .warningTurnLeftOrRightOnlyArrow:
                return Asset.Signs.warningTurnLeftOrRightOnlyArrowUS
            case .warningTramsCrossing:
                return Asset.Signs.warningTramsCrossingUS
            case .warningUnevenRoad:
                return Asset.Signs.warningUnevenRoadUS
            case .warningWildAnimals:
                return Asset.Signs.warningWildAnimalsUS
            case .regulatoryParkingRestrictions:
                return Asset.Signs.regulatoryParkingRestrictionsUS
            case .regulatoryYieldOrStopForPedestrians:
                return Asset.Signs.regulatoryYieldOrStopForPedestriansUS
            case .regulatoryNoBuses:
                return nil
            case .regulatoryNoMotorcyclesOrMopeds:
                return nil
            case .regulatoryNoTurnLeftOrTurnRight:
                return nil
            case .regulatoryNoOvertaking:
                return nil
            case .regulatoryNoHonking:
                return nil
            case .regulatoryWidthLimit:
                return nil
            case .regulatoryAxleWeightLimit:
                return nil
            case .regulatoryNoVehiclesCarryingExplosives:
                return nil
            case .regulatoryRoundabout:
                return nil
            case .regulatoryHonking:
                return nil
            case .regulatoryPedestriansCrossing:
                return nil
            case .regulatoryMotorVehicles:
                return nil
            case .regulatoryUTurn:
                return nil
            case .regulatoryNoSmallPassengerCar:
                return nil
            case .warningSteepAscent:
                return nil
            case .warningSteepDescent:
                return nil
            case .warningVillage:
                return nil
            case .warningKeepSlowdown:
                return nil
            case .warningDangerousTraffic:
                return nil
            case .warningRoadworks:
                return Asset.Signs.warningRoadworksUS
            case .warningSecondRoadLeft:
                return nil
            case .regulatoryNoTurnOnRedText:
                return nil
            case .warningAddedLaneLeft:
                return nil
            case .warningFlaggersInRoad:
                return nil
            case .warningLoop270Degree:
                return nil
            case .warningRoadNarrows:
                return nil
            case .warningSlipperyRoadSurface:
                return nil
            case .regulatoryBusLane:
                return nil
            case .regulatoryEndNoOvertaking:
                return nil
            case .regulatoryNoHumanCargoTricycleEntry:
                return nil
            case .regulatoryNoHumanPassengerTricycleEntry:
                return nil
            case .regulatoryNoRickshaws:
                return nil
            case .regulatoryNoStraightThroughOrTurnLeft:
                return nil
            case .regulatoryNoStraightThroughOrTurnRight:
                return nil
            case .regulatoryNoTractors:
                return nil
            case .regulatoryNoTricycles:
                return nil
            case .regulatoryUTurnOrTurnLeft:
                return nil
            case .regulatoryWalk:
                return nil
            case .warningDangerousMountainRoadLeft:
                return nil
            case .warningDangerousMountainRoadRight:
                return nil
            case .warningDomesticAnimals:
                return nil
            case .warningFallingRocksOrDebrisLeft:
                return nil
            case .warningHazardLane:
                return nil
            case .warningRailroadCrossingWithoutBarriers:
                return nil
            case .warningReverseCurveLeft:
                return nil
            case .warningReverseCurveRight:
                return nil
            case .warningSoftShoulderLeft:
                return nil
            case .warningSoftShoulderRight:
                return nil
            case .warningTunnel:
                return nil
            case .warningWaterPavement:
                return nil
            case .speedLimitAdvMax:
                return nil
            case .speedLimitEndAdv:
                return nil
            case .regulatoryEndLimitedAccessRoad:
                return nil
            case .regulatoryEndMotorway:
                return nil
            case .regulatoryEquestriansOnly:
                return nil
            case .regulatoryGasStation:
                return nil
            case .informationHospital:
                return nil
            case .informationLivingStreet:
                return nil
            case .regulatoryMotorway:
                return nil
            case .regulatorySharedLaneBicyclesPedestrians:
                return nil
            case .regulatoryEndPriorityRoad:
                return nil
            case .regulatoryEndProhibition:
                return nil
            case .regulatoryGiveWayToOncomingTraffic:
                return nil
            case .regulatoryMinSafeDist:
                return nil
            case .regulatoryNoDangerGoods:
                return nil
            case .regulatoryNoOverHeavy:
                return nil
            case .regulatoryPriorityOverOncomingTraffic:
                return nil
            case .regulatoryPriorityRoad:
                return nil
            case .regulatoryWeightLimit:
                return nil
            case .warningDangerousCrosswinds:
                return nil
            case .warningIcyRoad:
                return nil
            case .warningLowFlyingAircraft:
                return nil
            case .warningOpeningOrSwingBridge:
                return nil
            case .warningRailwayCrossingWithBarriers:
                return nil
            case .warningTrafficQueues:
                return nil
            case .regulatoryKeepLeftPicture:
                return nil
            case .regulatoryKeepLeftText:
                return nil
            case .aheadSpeedLimit:
                return nil
            case .warningSpeedLimit:
                return nil
            case .regulatoryNoUTurnRight:
                return nil
            case .warningTurnRightOnlyArrow:
                return nil
            case .informationCarWashing:
                return nil
            case .informationBusStop:
                return nil
            case .regulatoryPedestriansCrossingUp:
                return nil
            case .regulatoryPedestriansCrossingDown:
                return nil
            case .informationAutoService:
                return nil
            case .informationFood:
                return nil
            case .informationTown:
                return nil
            case .informationTownEnd:
                return nil
            case .regulatoryControl:
                return nil
            case .regulatoryDoubleUTurn:
                return nil
            case .speedLimitZone:
                return nil
            case .speedLimitEndZone:
                return nil
            }
        case .china:
            switch type {
            case .unknown:
                return nil
            case .mass:
                switch number {
                case 5:
                    return Asset.Signs.massCN5
                case 10:
                    return Asset.Signs.massCN10
                case 15:
                    return Asset.Signs.massCN15
                case 20:
                    return Asset.Signs.massCN20
                case 25:
                    return Asset.Signs.massCN25
                case 30:
                    return Asset.Signs.massCN30
                case 35:
                    return Asset.Signs.massCN35
                case 40:
                    return Asset.Signs.massCN40
                case 45:
                    return Asset.Signs.massCN45
                case 50:
                    return Asset.Signs.massCN50
                case 55:
                    return Asset.Signs.massCN55
                case 60:
                    return Asset.Signs.massCN60
                case 65:
                    return Asset.Signs.massCN65
                case 70:
                    return Asset.Signs.massCN70
                case 75:
                    return Asset.Signs.massCN75
                case 80:
                    return Asset.Signs.massCN80
                case 85:
                    return Asset.Signs.massCN85
                case 90:
                    return Asset.Signs.massCN90
                case 95:
                    return Asset.Signs.massCN95
                case 100:
                    return Asset.Signs.massCN100
                case 105:
                    return Asset.Signs.massCN105
                case 110:
                    return Asset.Signs.massCN110
                case 115:
                    return Asset.Signs.massCN115
                case 120:
                    return Asset.Signs.massCN120
                default: return nil
                }
            case .speedLimit:
                switch number {
                case 5:
                    return over ? Asset.Signs.speedLimitCN5Over : Asset.Signs.speedLimitCN5
                case 10:
                    return over ? Asset.Signs.speedLimitCN10Over : Asset.Signs.speedLimitCN10
                case 15:
                    return over ? Asset.Signs.speedLimitCN15Over : Asset.Signs.speedLimitCN15
                case 20:
                    return over ? Asset.Signs.speedLimitCN20Over : Asset.Signs.speedLimitCN20
                case 25:
                    return over ? Asset.Signs.speedLimitCN25Over : Asset.Signs.speedLimitCN25
                case 30:
                    return over ? Asset.Signs.speedLimitCN30Over : Asset.Signs.speedLimitCN30
                case 35:
                    return over ? Asset.Signs.speedLimitCN35Over : Asset.Signs.speedLimitCN35
                case 40:
                    return over ? Asset.Signs.speedLimitCN40Over : Asset.Signs.speedLimitCN40
                case 45:
                    return over ? Asset.Signs.speedLimitCN45Over : Asset.Signs.speedLimitCN45
                case 50:
                    return over ? Asset.Signs.speedLimitCN50Over : Asset.Signs.speedLimitCN50
                case 55:
                    return over ? Asset.Signs.speedLimitCN55Over : Asset.Signs.speedLimitCN55
                case 60:
                    return over ? Asset.Signs.speedLimitCN60Over : Asset.Signs.speedLimitCN60
                case 65:
                    return over ? Asset.Signs.speedLimitCN65Over : Asset.Signs.speedLimitCN65
                case 70:
                    return over ? Asset.Signs.speedLimitCN70Over : Asset.Signs.speedLimitCN70
                case 75:
                    return over ? Asset.Signs.speedLimitCN75Over : Asset.Signs.speedLimitCN75
                case 80:
                    return over ? Asset.Signs.speedLimitCN80Over : Asset.Signs.speedLimitCN80
                case 85:
                    return over ? Asset.Signs.speedLimitCN85Over : Asset.Signs.speedLimitCN85
                case 90:
                    return over ? Asset.Signs.speedLimitCN90Over : Asset.Signs.speedLimitCN90
                case 95:
                    return over ? Asset.Signs.speedLimitCN95Over : Asset.Signs.speedLimitCN95
                case 100:
                    return over ? Asset.Signs.speedLimitCN100Over : Asset.Signs.speedLimitCN100
                case 105:
                    return over ? Asset.Signs.speedLimitCN105Over : Asset.Signs.speedLimitCN105
                case 110:
                    return over ? Asset.Signs.speedLimitCN110Over : Asset.Signs.speedLimitCN110
                case 115:
                    return over ? Asset.Signs.speedLimitCN115Over : Asset.Signs.speedLimitCN115
                case 120:
                    return over ? Asset.Signs.speedLimitCN120Over : Asset.Signs.speedLimitCN120
                default: return nil
                }
            case .speedLimitEnd:
                switch number {
                case 5:
                    return Asset.Signs.speedLimitEndCN5
                case 10:
                    return Asset.Signs.speedLimitEndCN10
                case 15:
                    return Asset.Signs.speedLimitEndCN15
                case 20:
                    return Asset.Signs.speedLimitEndCN20
                case 25:
                    return Asset.Signs.speedLimitEndCN25
                case 30:
                    return Asset.Signs.speedLimitEndCN30
                case 35:
                    return Asset.Signs.speedLimitEndCN35
                case 40:
                    return Asset.Signs.speedLimitEndCN40
                case 45:
                    return Asset.Signs.speedLimitEndCN45
                case 50:
                    return Asset.Signs.speedLimitEndCN50
                case 55:
                    return Asset.Signs.speedLimitEndCN55
                case 60:
                    return Asset.Signs.speedLimitEndCN60
                case 65:
                    return Asset.Signs.speedLimitEndCN65
                case 70:
                    return Asset.Signs.speedLimitEndCN70
                case 75:
                    return Asset.Signs.speedLimitEndCN75
                case 80:
                    return Asset.Signs.speedLimitEndCN80
                case 85:
                    return Asset.Signs.speedLimitEndCN85
                case 90:
                    return Asset.Signs.speedLimitEndCN90
                case 95:
                    return Asset.Signs.speedLimitEndCN95
                case 100:
                    return Asset.Signs.speedLimitEndCN100
                case 105:
                    return Asset.Signs.speedLimitEndCN105
                case 110:
                    return Asset.Signs.speedLimitEndCN110
                case 115:
                    return Asset.Signs.speedLimitEndCN115
                case 120:
                    return Asset.Signs.speedLimitEndCN120
                default: return nil
                }
            case .speedLimitMin:
                switch number {
                case 5:
                    return Asset.Signs.speedMinimumCN5
                case 10:
                    return Asset.Signs.speedMinimumCN10
                case 15:
                    return Asset.Signs.speedMinimumCN15
                case 20:
                    return Asset.Signs.speedMinimumCN20
                case 25:
                    return Asset.Signs.speedMinimumCN25
                case 30:
                    return Asset.Signs.speedMinimumCN30
                case 35:
                    return Asset.Signs.speedMinimumCN35
                case 40:
                    return Asset.Signs.speedMinimumCN40
                case 55:
                    return Asset.Signs.speedMinimumCN55
                case 60:
                    return Asset.Signs.speedMinimumCN60
                case 65:
                    return Asset.Signs.speedMinimumCN65
                case 70:
                    return Asset.Signs.speedMinimumCN70
                case 75:
                    return Asset.Signs.speedMinimumCN75
                case 80:
                    return Asset.Signs.speedMinimumCN80
                case 85:
                    return Asset.Signs.speedMinimumCN85
                case 90:
                    return Asset.Signs.speedMinimumCN90
                case 95:
                    return Asset.Signs.speedMinimumCN95
                case 100:
                    return Asset.Signs.speedMinimumCN100
                case 105:
                    return Asset.Signs.speedMinimumCN105
                case 110:
                    return Asset.Signs.speedMinimumCN110
                case 115:
                    return Asset.Signs.speedMinimumCN115
                case 120:
                    return Asset.Signs.speedMinimumCN120
                default: return nil
                }
            case .speedLimitTrucks:
                return nil
            case .speedLimitNight:
                return nil
            case .speedLimitComplementary:
                return nil
            case .speedLimitExit:
                return nil
            case .speedLimitRamp:
                return nil
            case .warningTurnLeft:
                return nil
            case .warningTurnRight:
                return nil
            case .warningHairpinCurveLeft:
                return nil
            case .warningRoundabout:
                return Asset.Signs.warningRoundaboutCN
            case .warningSpeedBump:
                return nil
            case .warningWindingRoad:
                return Asset.Signs.warningWindingRoadCN
            case .informationBikeRoute:
                return nil
            case .informationParking:
                return Asset.Signs.informationParkingCN
            case .regulatoryAllDirectionsPermitted:
                return nil
            case .regulatoryBicyclesOnly:
                return Asset.Signs.regulatoryBicyclesOnlyCN
            case .regulatoryDoNotPass:
                return nil
            case .regulatoryDoNotDriveOnShoulder:
                return nil
            case .regulatoryDualLanesAllDirectionsOnRight:
                return nil
            case .regulatoryDualLanesGoLeftOrRight:
                return nil
            case .regulatoryDualLanesGoStraightOnLeft:
                return nil
            case .regulatoryDualLanesGoStraightOnRight:
                return nil
            case .regulatoryDualLanesTurnLeft:
                return nil
            case .regulatoryDualLanesTurnLeftOrStraight:
                return Asset.Signs.regulatoryDualLanesTurnLeftOrStraightCN
            case .regulatoryDualLanesTurnRightOrStraight:
                return Asset.Signs.regulatoryDualLanesTurnRightOrStraightCN
            case .regulatoryEndOfSchoolZone:
                return nil
            case .regulatoryGoStraight:
                return Asset.Signs.regulatoryGoStraightCN
            case .regulatoryGoStraightOrTurnLeft:
                return nil
            case .regulatoryGoStraightOrTurnRight:
                return nil
            case .regulatoryHeightLimit:
                return Asset.Signs.regulatoryHeightLimitCN
            case .regulatoryLeftTurnYieldOnGreen:
                return nil
            case .regulatoryNoBicycles:
                return Asset.Signs.regulatoryNoBicyclesCN
            case .regulatoryNoEntry:
                return Asset.Signs.regulatoryNoEntryCN
            case .regulatoryNoLeftOrUTurn:
                return nil
            case .regulatoryNoLeftTurn:
                return Asset.Signs.regulatoryNoLeftTurnCN
            case .regulatoryNoMotorVehicles:
                return Asset.Signs.regulatoryNoMotorVehiclesCN
            case .regulatoryNoParking:
                return Asset.Signs.regulatoryNoParkingCN
            case .regulatoryNoParkingOrNoStopping:
                return Asset.Signs.regulatoryNoParkingOrNoStoppingCN
            case .regulatoryNoPedestrians:
                return Asset.Signs.regulatoryNoPedestriansCN
            case .regulatoryNoRightTurn:
                return Asset.Signs.regulatoryNoRightTurnCN
            case .regulatoryNoStopping:
                return nil
            case .regulatoryNoStraightThrough:
                return Asset.Signs.regulatoryNoStraightThroughCN
            case .regulatoryNoUTurn:
                return Asset.Signs.regulatoryNoUTurnCN
            case .regulatoryOneWayStraight:
                return nil
            case .regulatoryReversibleLanes:
                return nil
            case .regulatoryRoadClosedToVehicles:
                return Asset.Signs.regulatoryRoadClosedToVehiclesCN
            case .regulatoryStop:
                return Asset.Signs.regulatoryStopCN
            case .regulatoryTrafficSignalPhotoEnforced:
                return nil
            case .regulatoryTripleLanesGoStraightCenterLane:
                return nil
            case .warningBicyclesCrossing:
                return nil
            case .warningHeightRestriction:
                return nil
            case .warningPassLeftOrRight:
                return nil
            case .warningPedestriansCrossing:
                return Asset.Signs.warningPedestriansCrossingCN
            case .warningRoadNarrowsLeft:
                return Asset.Signs.warningRoadNarrowsLeftCN
            case .warningRoadNarrowsRight:
                return Asset.Signs.warningRoadNarrowsRightCN
            case .warningSchoolZone:
                return Asset.Signs.warningSchoolZoneCN
            case .warningStopAhead:
                return nil
            case .warningTrafficSignals:
                return Asset.Signs.warningTrafficSignalsCN
            case .warningTwoWayTraffic:
                return Asset.Signs.warningTwoWayTrafficCN
            case .warningYieldAhead:
                return nil
            case .informationHighway:
                return nil
            case .regulatoryDoNotBlockIntersection:
                return nil
            case .regulatoryKeepRightPicture:
                return nil
            case .regulatoryKeepRightText:
                return nil
            case .regulatoryNoHeavyGoodsVehiclesPicture:
                return Asset.Signs.regulatoryNoHeavyGoodsVehiclesPictureCN
            case .regulatoryNoLeftTurnText:
                return nil
            case .regulatoryOneWayLeftArrow:
                return Asset.Signs.regulatoryOneWayLeftArrowCN
            case .regulatoryOneWayLeftArrowText:
                return nil
            case .regulatoryOneWayLeftText:
                return nil
            case .regulatoryOneWayRightArrow:
                return Asset.Signs.regulatoryOneWayRightArrowCN
            case .regulatoryOneWayRightArrowText:
                return nil
            case .regulatoryOneWayRightText:
                return nil
            case .regulatoryTurnLeftAhead:
                return nil
            case .regulatoryTurnLeft:
                return Asset.Signs.regulatoryTurnLeftCN
            case .regulatoryTurnLeftOrRight:
                return Asset.Signs.regulatoryTurnLeftOrRightCN
            case .regulatoryTurnRightAhead:
                return nil
            case .regulatoryYield:
                return Asset.Signs.regulatoryYieldCN
            case .warningRailwayCrossing:
                return Asset.Signs.warningRailwayCrossingCN
            case .warningHairpinCurveRight:
                return nil
            case .complementaryOneDirectionLeft:
                return nil
            case .complementaryOneDirectionRight:
                return nil
            case .warningCurveLeft:
                return Asset.Signs.warningCurveLeftCN
            case .warningCurveRight:
                return Asset.Signs.warningCurveRightCN
            case .warningHorizontalAlignmentLeft:
                return nil
            case .warningHorizontalAlignmentRight:
                return nil
            case .regulatoryTurnRight:
                return Asset.Signs.regulatoryTurnRightCN
            case .whiteTablesText:
                return nil
            case .lanes:
                return nil
            case .greenPlates:
                return nil
            case .warningText:
                return nil
            case .warningCrossroads:
                return nil
            case .warningPicture:
                return nil
            case .complementaryKeepLeft:
                return Asset.Signs.complementaryKeepLeftCN
            case .complementaryKeepRight:
                return Asset.Signs.complementaryKeepRightCN
            case .regulatoryExceptBicycle:
                return nil
            case .warningAddedLaneRight:
                return nil
            case .warningDeadEndText:
                return nil
            case .warningDipText:
                return nil
            case .warningEmergencyVehicles:
                return nil
            case .warningEndText:
                return nil
            case .warningFallingRocksOrDebrisRight:
                return Asset.Signs.warningFallingRocksOrDebrisRightCN
            case .warningLowGroundClearance:
                return nil
            case .warningObstructionMarker:
                return nil
            case .warningPlayground:
                return nil
            case .warningSecondRoadRight:
                return Asset.Signs.warningSecondRoadRightCN
            case .warningTurnLeftOnlyArrow:
                return nil
            case .warningTurnLeftOrRightOnlyArrow:
                return nil
            case .warningTramsCrossing:
                return nil
            case .warningUnevenRoad:
                return Asset.Signs.warningUnevenRoadCN
            case .warningWildAnimals:
                return nil
            case .regulatoryParkingRestrictions:
                return nil
            case .regulatoryYieldOrStopForPedestrians:
                return nil
            case .regulatoryNoBuses:
                return Asset.Signs.regulatoryNoBusesCN
            case .regulatoryNoSmallPassengerCar:
                return nil
            case .regulatoryNoMotorcyclesOrMopeds:
                return Asset.Signs.regulatoryNoMotorcyclesOrMopedsCN
            case .regulatoryNoTurnLeftOrTurnRight:
                return Asset.Signs.regulatoryNoTurnLeftOrTurnRightCN
            case .regulatoryNoOvertaking:
                return Asset.Signs.regulatoryNoOvertakingCN
            case .regulatoryNoHonking:
                return Asset.Signs.regulatoryNoHonkingCN
            case .regulatoryWidthLimit:
                return Asset.Signs.regulatoryWidthLimitCN
            case .regulatoryAxleWeightLimit:
                return Asset.Signs.regulatoryAxleWeightLimitCN
            case .regulatoryNoVehiclesCarryingExplosives:
                return Asset.Signs.regulatoryNoVehiclesCarryingExplosivesCN
            case .regulatoryRoundabout:
                return Asset.Signs.regulatoryRoundaboutCN
            case .regulatoryHonking:
                return Asset.Signs.regulatoryHonkingCN
            case .regulatoryPedestriansCrossing:
                return Asset.Signs.regulatoryPedestriansCrossingCN
            case .regulatoryMotorVehicles:
                return Asset.Signs.regulatoryMotorVehiclesCN
            case .regulatoryUTurn:
                return Asset.Signs.regulatoryUTurnCN
            case .warningSteepAscent:
                return Asset.Signs.warningSteepAscentCN
            case .warningSteepDescent:
                return Asset.Signs.warningSteepDescentCN
            case .warningVillage:
                return Asset.Signs.warningVillageCN
            case .warningKeepSlowdown:
                return Asset.Signs.warningKeepSlowdownCN
            case .warningDangerousTraffic:
                return Asset.Signs.warningDangerousTrafficCN
            case .warningRoadworks:
                return Asset.Signs.warningRoadworksCN
            case .warningSecondRoadLeft:
                return Asset.Signs.warningSecondRoadLeftCN
            case .regulatoryNoTurnOnRedText:
                return nil
            case .warningAddedLaneLeft:
                return nil
            case .warningFlaggersInRoad:
                return nil
            case .warningLoop270Degree:
                return nil
            case .warningRoadNarrows:
                return Asset.Signs.warningRoadNarrowsCN
            case .warningSlipperyRoadSurface:
                return Asset.Signs.warningSlipperyRoadSurfaceCN
            case .regulatoryBusLane:
                return Asset.Signs.regulatoryBusLaneCN
            case .regulatoryEndNoOvertaking:
                return Asset.Signs.regulatoryEndNoOvertakingCN
            case .regulatoryNoHumanCargoTricycleEntry:
                return Asset.Signs.regulatoryNoHumanCargoTricycleEntryCN
            case .regulatoryNoHumanPassengerTricycleEntry:
                return Asset.Signs.regulatoryNoHumanPassengerTricycleEntryCN
            case .regulatoryNoRickshaws:
                return Asset.Signs.regulatoryNoRickshawsCN
            case .regulatoryNoStraightThroughOrTurnLeft:
                return Asset.Signs.regulatoryNoStraightThroughOrTurnLeftCN
            case .regulatoryNoStraightThroughOrTurnRight:
                return Asset.Signs.regulatoryNoStraightThroughOrTurnRightCN
            case .regulatoryNoTractors:
                return Asset.Signs.regulatoryNoTractorsCN
            case .regulatoryNoTricycles:
                return Asset.Signs.regulatoryNoTricyclesCN
            case .regulatoryUTurnOrTurnLeft:
                return Asset.Signs.regulatoryUTurnOrTurnLeftCN
            case .regulatoryWalk:
                return Asset.Signs.regulatoryWalkCN
            case .warningDangerousMountainRoadLeft:
                return Asset.Signs.warningDangerousMountainRoadLeftCN
            case .warningDangerousMountainRoadRight:
                return Asset.Signs.warningDangerousMountainRoadRightCN
            case .warningDomesticAnimals:
                return Asset.Signs.warningDomesticAnimalsCN
            case .warningFallingRocksOrDebrisLeft:
                return Asset.Signs.warningFallingRocksOrDebrisLeftCN
            case .warningHazardLane:
                return nil
            case .warningRailroadCrossingWithoutBarriers:
                return Asset.Signs.warningRailroadCrossingWithoutBarriersCN
            case .warningReverseCurveLeft:
                return Asset.Signs.warningReverseCurveLeftCN
            case .warningReverseCurveRight:
                return Asset.Signs.warningReverseCurveRightCN
            case .warningSoftShoulderLeft:
                return Asset.Signs.warningSoftShoulderLeftCN
            case .warningSoftShoulderRight:
                return Asset.Signs.warningSoftShoulderRightCN
            case .warningTunnel:
                return Asset.Signs.warningTunnelCN
            case .warningWaterPavement:
                return Asset.Signs.warningWaterPavementCN
            case .speedLimitAdvMax:
                return nil
            case .speedLimitEndAdv:
                return nil
            case .regulatoryEndLimitedAccessRoad:
                return nil
            case .regulatoryEndMotorway:
                return nil
            case .regulatoryEquestriansOnly:
                return nil
            case .regulatoryGasStation:
                return nil
            case .informationHospital:
                return nil
            case .informationLivingStreet:
                return nil
            case .regulatoryMotorway:
                return nil
            case .regulatorySharedLaneBicyclesPedestrians:
                return nil
            case .regulatoryEndPriorityRoad:
                return nil
            case .regulatoryEndProhibition:
                return nil
            case .regulatoryGiveWayToOncomingTraffic:
                return nil
            case .regulatoryMinSafeDist:
                return nil
            case .regulatoryNoDangerGoods:
                return nil
            case .regulatoryNoOverHeavy:
                return nil
            case .regulatoryPriorityOverOncomingTraffic:
                return nil
            case .regulatoryPriorityRoad:
                return nil
            case .regulatoryWeightLimit:
                return nil
            case .warningDangerousCrosswinds:
                return nil
            case .warningIcyRoad:
                return nil
            case .warningLowFlyingAircraft:
                return nil
            case .warningOpeningOrSwingBridge:
                return nil
            case .warningRailwayCrossingWithBarriers:
                return nil
            case .warningTrafficQueues:
                return nil
            case .regulatoryKeepLeftPicture:
                return nil
            case .regulatoryKeepLeftText:
                return nil
            case .aheadSpeedLimit:
                return nil
            case .warningSpeedLimit:
                return nil
            case .regulatoryNoUTurnRight:
                return nil
            case .warningTurnRightOnlyArrow:
                return nil
            case .informationCarWashing:
                return nil
            case .informationBusStop:
                return nil
            case .regulatoryPedestriansCrossingUp:
                return nil
            case .regulatoryPedestriansCrossingDown:
                return nil
            case .informationAutoService:
                return nil
            case .informationFood:
                return nil
            case .informationTown:
                return nil
            case .informationTownEnd:
                return nil
            case .regulatoryControl:
                return nil
            case .regulatoryDoubleUTurn:
                return nil
            case .speedLimitZone:
                return nil
            case .speedLimitEndZone:
                return nil
            }
        case .UK, .germany, .other:
            switch type {
            case .unknown:
                return nil
            case .speedLimit:
                switch number {
                case 5:
                    return over ? Asset.Signs.speedLimitEU5Over : Asset.Signs.speedLimitEU5
                case 10:
                    return over ? Asset.Signs.speedLimitEU10Over : Asset.Signs.speedLimitEU10
                case 15:
                    return over ? Asset.Signs.speedLimitEU15Over : Asset.Signs.speedLimitEU15
                case 20:
                    return over ? Asset.Signs.speedLimitEU20Over : Asset.Signs.speedLimitEU20
                case 25:
                    return over ? Asset.Signs.speedLimitEU25Over : Asset.Signs.speedLimitEU25
                case 30:
                    return over ? Asset.Signs.speedLimitEU30Over : Asset.Signs.speedLimitEU30
                case 35:
                    return over ? Asset.Signs.speedLimitEU35Over : Asset.Signs.speedLimitEU35
                case 40:
                    return over ? Asset.Signs.speedLimitEU40Over : Asset.Signs.speedLimitEU40
                case 45:
                    return over ? Asset.Signs.speedLimitEU45Over : Asset.Signs.speedLimitEU45
                case 50:
                    return over ? Asset.Signs.speedLimitEU50Over : Asset.Signs.speedLimitEU50
                case 55:
                    return over ? Asset.Signs.speedLimitEU55Over : Asset.Signs.speedLimitEU55
                case 60:
                    return over ? Asset.Signs.speedLimitEU60Over : Asset.Signs.speedLimitEU60
                case 65:
                    return over ? Asset.Signs.speedLimitEU65Over : Asset.Signs.speedLimitEU65
                case 70:
                    return over ? Asset.Signs.speedLimitEU70Over : Asset.Signs.speedLimitEU70
                case 75:
                    return over ? Asset.Signs.speedLimitEU75Over : Asset.Signs.speedLimitEU75
                case 80:
                    return over ? Asset.Signs.speedLimitEU80Over : Asset.Signs.speedLimitEU80
                case 85:
                    return over ? Asset.Signs.speedLimitEU85Over : Asset.Signs.speedLimitEU85
                case 90:
                    return over ? Asset.Signs.speedLimitEU90Over : Asset.Signs.speedLimitEU90
                case 95:
                    return over ? Asset.Signs.speedLimitEU95Over : Asset.Signs.speedLimitEU95
                case 100:
                    return over ? Asset.Signs.speedLimitEU100Over : Asset.Signs.speedLimitEU100
                case 105:
                    return over ? Asset.Signs.speedLimitEU105Over : Asset.Signs.speedLimitEU105
                case 110:
                    return over ? Asset.Signs.speedLimitEU110Over : Asset.Signs.speedLimitEU110
                case 115:
                    return over ? Asset.Signs.speedLimitEU115Over : Asset.Signs.speedLimitEU115
                case 120:
                    return over ? Asset.Signs.speedLimitEU120Over : Asset.Signs.speedLimitEU120
                default: return nil
                }
            case .speedLimitEnd:
                switch number {
                case 5:
                    return Asset.Signs.speedLimitEndEU5
                case 10:
                    return Asset.Signs.speedLimitEndEU10
                case 15:
                    return Asset.Signs.speedLimitEndEU15
                case 20:
                    return Asset.Signs.speedLimitEndEU20
                case 25:
                    return Asset.Signs.speedLimitEndEU25
                case 30:
                    return Asset.Signs.speedLimitEndEU30
                case 35:
                    return Asset.Signs.speedLimitEndEU35
                case 40:
                    return Asset.Signs.speedLimitEndEU40
                case 45:
                    return Asset.Signs.speedLimitEndEU45
                case 50:
                    return Asset.Signs.speedLimitEndEU50
                case 55:
                    return Asset.Signs.speedLimitEndEU55
                case 60:
                    return Asset.Signs.speedLimitEndEU60
                case 65:
                    return Asset.Signs.speedLimitEndEU65
                case 70:
                    return Asset.Signs.speedLimitEndEU70
                case 75:
                    return Asset.Signs.speedLimitEndEU75
                case 80:
                    return Asset.Signs.speedLimitEndEU80
                case 85:
                    return Asset.Signs.speedLimitEndEU85
                case 90:
                    return Asset.Signs.speedLimitEndEU90
                case 95:
                    return Asset.Signs.speedLimitEndEU95
                case 100:
                    return Asset.Signs.speedLimitEndEU100
                case 105:
                    return Asset.Signs.speedLimitEndEU105
                case 110:
                    return Asset.Signs.speedLimitEndEU110
                case 115:
                    return Asset.Signs.speedLimitEndEU115
                case 120:
                    return Asset.Signs.speedLimitEndEU120
                default: return nil
                }
            case .speedLimitMin:
                switch number {
                case 5:
                    return Asset.Signs.speedLimitMinEU5
                case 10:
                    return Asset.Signs.speedLimitMinEU10
                case 15:
                    return Asset.Signs.speedLimitMinEU15
                case 20:
                    return Asset.Signs.speedLimitMinEU20
                case 25:
                    return Asset.Signs.speedLimitMinEU25
                case 30:
                    return Asset.Signs.speedLimitMinEU30
                case 35:
                    return Asset.Signs.speedLimitMinEU35
                case 40:
                    return Asset.Signs.speedLimitMinEU40
                case 45:
                    return Asset.Signs.speedLimitMinEU45
                case 50:
                    return Asset.Signs.speedLimitMinEU50
                case 55:
                    return Asset.Signs.speedLimitMinEU55
                case 60:
                    return Asset.Signs.speedLimitMinEU60
                case 65:
                    return Asset.Signs.speedLimitMinEU65
                case 70:
                    return Asset.Signs.speedLimitMinEU70
                case 75:
                    return Asset.Signs.speedLimitMinEU75
                case 80:
                    return Asset.Signs.speedLimitMinEU80
                case 85:
                    return Asset.Signs.speedLimitMinEU85
                case 90:
                    return Asset.Signs.speedLimitMinEU90
                case 95:
                    return Asset.Signs.speedLimitMinEU95
                case 100:
                    return Asset.Signs.speedLimitMinEU100
                case 105:
                    return Asset.Signs.speedLimitMinEU105
                case 110:
                    return Asset.Signs.speedLimitMinEU110
                case 115:
                    return Asset.Signs.speedLimitMinEU115
                case 120:
                    return Asset.Signs.speedLimitMinEU120
                default: return nil
                }
            case .speedLimitAdvMax:
                switch number {
                case 5:
                    return Asset.Signs.speedLimitAdvMaxEU5
                case 10:
                    return Asset.Signs.speedLimitAdvMaxEU10
                case 15:
                    return Asset.Signs.speedLimitAdvMaxEU15
                case 20:
                    return Asset.Signs.speedLimitAdvMaxEU20
                case 25:
                    return Asset.Signs.speedLimitAdvMaxEU25
                case 30:
                    return Asset.Signs.speedLimitAdvMaxEU30
                case 35:
                    return Asset.Signs.speedLimitAdvMaxEU35
                case 40:
                    return Asset.Signs.speedLimitAdvMaxEU40
                case 45:
                    return Asset.Signs.speedLimitAdvMaxEU45
                case 50:
                    return Asset.Signs.speedLimitAdvMaxEU50
                case 55:
                    return Asset.Signs.speedLimitAdvMaxEU55
                case 60:
                    return Asset.Signs.speedLimitAdvMaxEU60
                case 65:
                    return Asset.Signs.speedLimitAdvMaxEU65
                case 70:
                    return Asset.Signs.speedLimitAdvMaxEU70
                case 75:
                    return Asset.Signs.speedLimitAdvMaxEU75
                case 80:
                    return Asset.Signs.speedLimitAdvMaxEU80
                case 85:
                    return Asset.Signs.speedLimitAdvMaxEU85
                case 90:
                    return Asset.Signs.speedLimitAdvMaxEU90
                case 95:
                    return Asset.Signs.speedLimitAdvMaxEU95
                case 100:
                    return Asset.Signs.speedLimitAdvMaxEU100
                case 105:
                    return Asset.Signs.speedLimitAdvMaxEU115
                case 110:
                    return Asset.Signs.speedLimitAdvMaxEU110
                case 115:
                    return Asset.Signs.speedLimitAdvMaxEU115
                case 120:
                    return Asset.Signs.speedLimitAdvMaxEU120
                default: return nil
                }
            case .speedLimitEndAdv:
                switch number {
                case 5:
                    return Asset.Signs.speedLimitEndAdvEU5
                case 10:
                    return Asset.Signs.speedLimitEndAdvEU10
                case 15:
                    return Asset.Signs.speedLimitEndAdvEU15
                case 20:
                    return Asset.Signs.speedLimitEndAdvEU20
                case 25:
                    return Asset.Signs.speedLimitEndAdvEU25
                case 30:
                    return Asset.Signs.speedLimitEndAdvEU30
                case 35:
                    return Asset.Signs.speedLimitEndAdvEU35
                case 40:
                    return Asset.Signs.speedLimitEndAdvEU40
                case 45:
                    return Asset.Signs.speedLimitEndAdvEU45
                case 50:
                    return Asset.Signs.speedLimitEndAdvEU50
                case 55:
                    return Asset.Signs.speedLimitEndAdvEU55
                case 60:
                    return Asset.Signs.speedLimitEndAdvEU60
                case 65:
                    return Asset.Signs.speedLimitEndAdvEU65
                case 70:
                    return Asset.Signs.speedLimitEndAdvEU70
                case 75:
                    return Asset.Signs.speedLimitEndAdvEU75
                case 80:
                    return Asset.Signs.speedLimitEndAdvEU80
                case 85:
                    return Asset.Signs.speedLimitEndAdvEU85
                case 90:
                    return Asset.Signs.speedLimitEndAdvEU90
                case 95:
                    return Asset.Signs.speedLimitEndAdvEU95
                case 100:
                    return Asset.Signs.speedLimitEndAdvEU100
                case 105:
                    return Asset.Signs.speedLimitEndAdvEU115
                case 110:
                    return Asset.Signs.speedLimitEndAdvEU110
                case 115:
                    return Asset.Signs.speedLimitEndAdvEU115
                case 120:
                    return Asset.Signs.speedLimitEndAdvEU120
                default: return nil
                }
            case .complementaryKeepLeft:
                return Asset.Signs.complementaryKeepLeftEU
            case .complementaryKeepRight:
                return Asset.Signs.complementaryKeepRightEU
            case .informationHospital:
                return Asset.Signs.informationHospitalEU
            case .informationLivingStreet:
                if country == .UK {
                    return Asset.Signs.informationLivingStreetUK
                } else {
                    return Asset.Signs.informationLivingStreetEU
                }
            case .informationParking:
                return Asset.Signs.informationParkingEU
            case .regulatoryAxleWeightLimit:
                return Asset.Signs.regulatoryAxleWeightLimitEU
            case .regulatoryBicyclesOnly:
                return Asset.Signs.regulatoryBicyclesOnlyEU
            case .regulatoryBusLane:
                return Asset.Signs.regulatoryBusLaneEU
            case .regulatoryDualLanesTurnLeftOrStraight:
                return Asset.Signs.regulatoryDualLanesTurnLeftOrStraightEU
            case .regulatoryDualLanesTurnRightOrStraight:
                return Asset.Signs.regulatoryDualLanesTurnRightOrStraightEU
            case .regulatoryEndLimitedAccessRoad:
                return Asset.Signs.regulatoryEndLimitedAccessRoadEU
            case .regulatoryEndMotorway:
                if country == .UK {
                    return Asset.Signs.regulatoryEndMotorwayUK
                } else {
                    return Asset.Signs.regulatoryEndMotorwayEU
                }
            case .regulatoryEndPriorityRoad:
                return Asset.Signs.regulatoryEndPriorityRoadEU
            case .regulatoryEndProhibition:
                if country == .UK {
                    return Asset.Signs.regulatoryEndProhibitionUK
                } else {
                    return Asset.Signs.regulatoryEndProhibitionEU
                }
            case .regulatoryGiveWayToOncomingTraffic:
                if country == .UK {
                    return Asset.Signs.regulatoryGiveWayToOncomingTrafficUK
                } else {
                    return Asset.Signs.regulatoryGiveWayToOncomingTrafficEU
                }
            case .regulatoryGoStraight:
                return Asset.Signs.regulatoryGoStraightEU
            case .regulatoryHeightLimit:
                return Asset.Signs.regulatoryHeightLimitEU
            case .regulatoryMinSafeDist:
                return Asset.Signs.regulatoryMinSafeDistEU
            case .regulatoryMotorVehicles:
                return Asset.Signs.regulatoryMotorVehiclesEU
            case .regulatoryMotorway:
                if country == .UK {
                    return Asset.Signs.regulatoryMotorwayUK
                } else {
                    return Asset.Signs.regulatoryMotorwayEU
                }
            case .regulatoryNoBicycles:
                return Asset.Signs.regulatoryNoBicyclesEU
            case .regulatoryNoBuses:
                return Asset.Signs.regulatoryNoBusesEU
            case .regulatoryNoDangerGoods:
                if country == .UK {
                    return Asset.Signs.regulatoryNoDangerGoodsUK
                } else {
                    return Asset.Signs.regulatoryNoDangerGoodsEU
                }
            case .regulatoryNoEntry:
                return Asset.Signs.regulatoryNoEntryEU
            case .regulatoryNoHeavyGoodsVehiclesPicture:
                return Asset.Signs.regulatoryNoHeavyGoodsVehiclesPictureEU
            case .regulatoryNoLeftTurn:
                return Asset.Signs.regulatoryNoLeftTurnEU
            case .regulatoryNoMotorVehicles:
                return Asset.Signs.regulatoryNoMotorVehiclesEU
            case .regulatoryNoMotorcyclesOrMopeds:
                return Asset.Signs.regulatoryNoMotorcyclesOrMopedsEU
            case .regulatoryNoOverHeavy:
                return Asset.Signs.regulatoryNoOverHeavyEU
            case .regulatoryNoOvertaking:
                if country == .UK {
                    return Asset.Signs.regulatoryNoOvertakingUK
                } else {
                    return Asset.Signs.regulatoryNoOvertakingEU
                }
            case .regulatoryNoParking:
                return Asset.Signs.regulatoryNoParkingEU
            case .regulatoryNoPedestrians:
                if country == .UK {
                    return Asset.Signs.regulatoryNoPedestriansUK
                } else {
                    return Asset.Signs.regulatoryNoPedestriansEU
                }
            case .regulatoryNoRightTurn:
                return Asset.Signs.regulatoryNoRightTurnEU
            case .regulatoryNoUTurn:
                return Asset.Signs.regulatoryNoUTurnEU
            case .regulatoryNoParkingOrNoStopping:
                return Asset.Signs.regulatoryNoParkingOrNoStoppingEU
            case .regulatoryOneWayLeftArrow:
                return Asset.Signs.regulatoryOneWayLeftArrowEU
            case .regulatoryOneWayRightArrow:
                return Asset.Signs.regulatoryOneWayRightArrowEU
            case .regulatoryOneWayStraight:
                return Asset.Signs.regulatoryOneWayStraightEU
            case .regulatoryPedestriansCrossing:
                return Asset.Signs.regulatoryPedestriansCrossingEU
            case .regulatoryPriorityOverOncomingTraffic:
                if country == .UK {
                    return Asset.Signs.regulatoryPriorityOverOncomingTrafficUK
                } else {
                    return Asset.Signs.regulatoryPriorityOverOncomingTrafficEU
                }
            case .regulatoryPriorityRoad:
                return Asset.Signs.regulatoryPriorityRoadEU
            case .regulatoryRoadClosedToVehicles:
                return Asset.Signs.regulatoryRoadClosedToVehiclesEU
            case .regulatoryRoundabout:
                return Asset.Signs.regulatoryRoundaboutEU
            case .regulatorySharedLaneBicyclesPedestrians:
                if country == .UK {
                    return Asset.Signs.regulatorySharedLaneBicyclesPedestriansUK
                } else {
                    return Asset.Signs.regulatorySharedLaneBicyclesPedestriansEU
                }
            case .regulatoryStop:
                return Asset.Signs.regulatoryStopEU
            case .regulatoryTurnLeft:
                return Asset.Signs.regulatoryTurnLeftEU
            case .regulatoryTurnLeftOrRight:
                return Asset.Signs.regulatoryTurnLeftOrRightEU
            case .regulatoryTurnRight:
                return Asset.Signs.regulatoryTurnRightEU
            case .regulatoryWalk:
                return Asset.Signs.regulatoryWalkEU
            case .regulatoryWeightLimit:
                return Asset.Signs.regulatoryWeightLimitEU
            case .regulatoryWidthLimit:
                return Asset.Signs.regulatoryWidthLimitEU
            case .regulatoryYield:
                if country == .UK {
                    return Asset.Signs.regulatoryYieldUK
                } else {
                    return Asset.Signs.regulatoryYieldEU
                }
            case .warningBicyclesCrossing:
                return Asset.Signs.warningBicyclesCrossingEU
            case .warningCurveLeft:
                return Asset.Signs.warningCurveLeftEU
            case .warningCurveRight:
                return Asset.Signs.warningCurveRightEU
            case .warningDangerousCrosswinds:
                if country == .UK {
                    return Asset.Signs.warningDangerousCrosswindsUK
                } else {
                    return Asset.Signs.warningDangerousCrosswindsEU
                }
            case .warningDangerousTraffic:
                return Asset.Signs.warningDangerousTrafficEU
            case .warningDeadEndText:
                return Asset.Signs.warningDeadEndTextEU
            case .warningDomesticAnimals:
                if country == .UK {
                    return Asset.Signs.warningDomesticAnimalsUK
                } else {
                    return Asset.Signs.warningDomesticAnimalsEU
                }
            case .warningFallingRocksOrDebrisLeft:
                return Asset.Signs.warningFallingRocksOrDebrisLeftEU
            case .warningFallingRocksOrDebrisRight:
                return Asset.Signs.warningFallingRocksOrDebrisRightEU
            case .warningIcyRoad:
                return Asset.Signs.warningIcyRoadEU
            case .warningLowFlyingAircraft:
                return Asset.Signs.warningLowFlyingAircraftEU
            case .warningLowGroundClearance:
                if country == .UK {
                    return Asset.Signs.warningLowGroundClearanceUK
                } else {
                    return Asset.Signs.warningLowGroundClearanceEU
                }
            case .warningOpeningOrSwingBridge:
                return Asset.Signs.warningOpeningOrSwingBridgeEU
            case .warningPassLeftOrRight:
                return Asset.Signs.warningPassLeftOrRightEU
            case .warningPedestriansCrossing:
                if country == .UK {
                    return Asset.Signs.warningPedestriansCrossingUK
                } else {
                    return Asset.Signs.warningPedestriansCrossingEU
                }
            case .warningRailroadCrossingWithoutBarriers:
                if country == .UK {
                    return Asset.Signs.warningRailroadCrossingWithoutBarriersUK
                } else {
                    return Asset.Signs.warningRailroadCrossingWithoutBarriersEU
                }
            case .warningRailwayCrossing:
                return Asset.Signs.warningRailwayCrossingEU
            case .warningRailwayCrossingWithBarriers:
                return Asset.Signs.warningRailwayCrossingWithBarriersEU
            case .warningRoadNarrows:
                return Asset.Signs.warningRoadNarrowsEU
            case .warningRoadNarrowsLeft:
                return Asset.Signs.warningRoadNarrowsLeftEU
            case .warningRoadNarrowsRight:
                return Asset.Signs.warningRoadNarrowsRightEU
            case .warningRoadworks:
                if country == .UK {
                    return Asset.Signs.warningRoadworksUK
                } else {
                    return Asset.Signs.warningRoadworksEU
                }
            case .warningRoundabout:
                if country == .UK {
                    return Asset.Signs.warningRoundAboutUK
                } else {
                    return Asset.Signs.warningRoundAboutEU
                }
            case .warningSchoolZone:
                if country == .UK {
                    return Asset.Signs.warningSchoolZoneUK
                } else {
                    return Asset.Signs.warningSchoolZoneEU
                }
            case .warningSlipperyRoadSurface:
                return Asset.Signs.warningSlipperyRoadSurfaceEU
            case .warningSoftShoulderLeft:
                return Asset.Signs.warningSoftShoulderLeftEU
            case .warningSoftShoulderRight:
                return Asset.Signs.warningSoftShoulderRightEU
            case .warningSpeedBump:
                return Asset.Signs.warningSpeedBumpEU
            case .warningSteepAscent:
                return Asset.Signs.warningSteepAscentEU
            case .warningSteepDescent:
                return Asset.Signs.warningSteepDescentEU
            case .warningTrafficQueues:
                if country == .UK {
                    return Asset.Signs.warningTrafficQueuesUK
                } else {
                    return Asset.Signs.warningTrafficQueuesEU
                }
            case .warningTrafficSignals:
                return Asset.Signs.warningTrafficSignalsEU
            case .warningTramsCrossing:
                return Asset.Signs.warningTramsCrossingEU
            case .warningTwoWayTraffic:
                if country == .UK {
                    return Asset.Signs.warningTwoWayTrafficUK
                } else {
                    return Asset.Signs.warningTwoWayTrafficEU
                }
            case .warningUnevenRoad:
                return Asset.Signs.warningUnevenRoadEU
            case .warningWildAnimals:
                if country == .UK {
                    return Asset.Signs.warningWildAnimalsUK
                } else {
                    return Asset.Signs.warningWildAnimalsEU
                }
            case .warningWindingRoad:
                if country == .UK {
                    return Asset.Signs.warningWindingRoadUK
                } else {
                    return Asset.Signs.warningWindingRoadEU
                }
            case .speedLimitNight:
                return nil
            case .speedLimitTrucks:
                return nil
            case .mass:
                return nil
            case .speedLimitComplementary:
                return nil
            case .speedLimitExit:
                return nil
            case .speedLimitRamp:
                return nil
            case .warningTurnLeft:
                return nil
            case .warningTurnRight:
                return nil
            case .warningHairpinCurveLeft:
                return nil
            case .informationBikeRoute:
                return nil
            case .regulatoryAllDirectionsPermitted:
                return nil
            case .regulatoryDoNotPass:
                return nil
            case .regulatoryDoNotDriveOnShoulder:
                return nil
            case .regulatoryDualLanesAllDirectionsOnRight:
                return nil
            case .regulatoryDualLanesGoLeftOrRight:
                return nil
            case .regulatoryDualLanesGoStraightOnLeft:
                return nil
            case .regulatoryDualLanesGoStraightOnRight:
                return nil
            case .regulatoryDualLanesTurnLeft:
                return nil
            case .regulatoryEndOfSchoolZone:
                return nil
            case .regulatoryGoStraightOrTurnLeft:
                return nil
            case .regulatoryGoStraightOrTurnRight:
                return nil
            case .regulatoryLeftTurnYieldOnGreen:
                return nil
            case .regulatoryNoLeftOrUTurn:
                return nil
            case .regulatoryNoStopping:
                return nil
            case .regulatoryNoStraightThrough:
                return nil
            case .regulatoryReversibleLanes:
                return nil
            case .regulatoryTrafficSignalPhotoEnforced:
                return nil
            case .regulatoryTripleLanesGoStraightCenterLane:
                return nil
            case .warningHeightRestriction:
                return nil
            case .warningStopAhead:
                return nil
            case .warningYieldAhead:
                return nil
            case .informationHighway:
                return nil
            case .regulatoryDoNotBlockIntersection:
                return nil
            case .regulatoryKeepRightPicture:
                return nil
            case .regulatoryKeepRightText:
                return nil
            case .regulatoryNoLeftTurnText:
                return nil
            case .regulatoryOneWayLeftArrowText:
                return nil
            case .regulatoryOneWayLeftText:
                return nil
            case .regulatoryOneWayRightArrowText:
                return nil
            case .regulatoryOneWayRightText:
                return nil
            case .regulatoryTurnLeftAhead:
                return nil
            case .regulatoryTurnRightAhead:
                return nil
            case .warningHairpinCurveRight:
                return nil
            case .complementaryOneDirectionLeft:
                return nil
            case .complementaryOneDirectionRight:
                return nil
            case .warningHorizontalAlignmentLeft:
                return nil
            case .warningHorizontalAlignmentRight:
                return nil
            case .whiteTablesText:
                return nil
            case .lanes:
                return nil
            case .greenPlates:
                return nil
            case .warningText:
                return nil
            case .warningCrossroads:
                return nil
            case .warningPicture:
                return nil
            case .regulatoryExceptBicycle:
                return nil
            case .warningAddedLaneRight:
                return nil
            case .warningDipText:
                return nil
            case .warningEmergencyVehicles:
                return nil
            case .warningEndText:
                return nil
            case .warningObstructionMarker:
                return nil
            case .warningPlayground:
                return nil
            case .warningSecondRoadRight:
                return nil
            case .warningTurnLeftOnlyArrow:
                return nil
            case .warningTurnLeftOrRightOnlyArrow:
                return nil
            case .regulatoryParkingRestrictions:
                return nil
            case .regulatoryYieldOrStopForPedestrians:
                return nil
            case .regulatoryNoTurnLeftOrTurnRight:
                return nil
            case .regulatoryNoHonking:
                return nil
            case .regulatoryNoVehiclesCarryingExplosives:
                return nil
            case .regulatoryHonking:
                return nil
            case .regulatoryUTurn:
                return nil
            case .regulatoryNoSmallPassengerCar:
                return nil
            case .warningVillage:
                return nil
            case .warningKeepSlowdown:
                return nil
            case .warningSecondRoadLeft:
                return nil
            case .regulatoryNoTurnOnRedText:
                return nil
            case .warningAddedLaneLeft:
                return nil
            case .warningFlaggersInRoad:
                return nil
            case .warningLoop270Degree:
                return nil
            case .regulatoryEndNoOvertaking:
                return nil
            case .regulatoryNoHumanCargoTricycleEntry:
                return nil
            case .regulatoryNoHumanPassengerTricycleEntry:
                return nil
            case .regulatoryNoRickshaws:
                return nil
            case .regulatoryNoStraightThroughOrTurnLeft:
                return nil
            case .regulatoryNoStraightThroughOrTurnRight:
                return nil
            case .regulatoryNoTractors:
                return nil
            case .regulatoryNoTricycles:
                return nil
            case .regulatoryUTurnOrTurnLeft:
                return nil
            case .warningDangerousMountainRoadLeft:
                return nil
            case .warningDangerousMountainRoadRight:
                return nil
            case .warningHazardLane:
                return nil
            case .warningReverseCurveLeft:
                return nil
            case .warningReverseCurveRight:
                return nil
            case .warningTunnel:
                return nil
            case .warningWaterPavement:
                return nil
            case .regulatoryEquestriansOnly:
                return nil
            case .regulatoryGasStation:
                return nil
            case .regulatoryKeepLeftPicture:
                return nil
            case .regulatoryKeepLeftText:
                return nil
            case .aheadSpeedLimit:
                return nil
            case .warningSpeedLimit:
                return nil
            case .regulatoryNoUTurnRight:
                return nil
            case .warningTurnRightOnlyArrow:
                return nil
            case .informationCarWashing:
                return Asset.Signs.informationCarWashingEU
            case .informationBusStop:
                if country == .germany {
                    return Asset.Signs.informationBusStopDE
                } else {
                    return Asset.Signs.informationBusStopEU
                }
            case .regulatoryPedestriansCrossingUp:
                return Asset.Signs.regulatoryPedestriansCrossingUpEU
            case .regulatoryPedestriansCrossingDown:
                return Asset.Signs.regulatoryPedestriansCrossingDownEU
            case .informationAutoService:
                return Asset.Signs.informationAutoServiceEU
            case .informationFood:
                return Asset.Signs.informationFoodEU
            case .informationTown:
                return Asset.Signs.informationTownEU
            case .informationTownEnd:
                return Asset.Signs.informationTownEndEU
            case .regulatoryControl:
                return Asset.Signs.regulatoryControlEU
            case .regulatoryDoubleUTurn:
                return Asset.Signs.regulatoryDoubleUTurnEU
            case .speedLimitZone:
                switch number {
                case 5:
                    return Asset.Signs.speedLimitZoneEU5
                case 10:
                    return Asset.Signs.speedLimitZoneEU10
                case 15:
                    return Asset.Signs.speedLimitZoneEU15
                case 20:
                    return Asset.Signs.speedLimitZoneEU20
                case 25:
                    return Asset.Signs.speedLimitZoneEU25
                case 30:
                    return Asset.Signs.speedLimitZoneEU30
                case 35:
                    return Asset.Signs.speedLimitZoneEU35
                case 40:
                    return Asset.Signs.speedLimitZoneEU40
                case 45:
                    return Asset.Signs.speedLimitZoneEU45
                case 50:
                    return Asset.Signs.speedLimitZoneEU50
                case 55:
                    return Asset.Signs.speedLimitZoneEU55
                case 60:
                    return Asset.Signs.speedLimitZoneEU60
                case 65:
                    return Asset.Signs.speedLimitZoneEU65
                case 70:
                    return Asset.Signs.speedLimitZoneEU70
                case 75:
                    return Asset.Signs.speedLimitZoneEU75
                case 80:
                    return Asset.Signs.speedLimitZoneEU80
                case 85:
                    return Asset.Signs.speedLimitZoneEU85
                case 90:
                    return Asset.Signs.speedLimitZoneEU90
                case 95:
                    return Asset.Signs.speedLimitZoneEU95
                case 100:
                    return Asset.Signs.speedLimitZoneEU100
                case 105:
                    return Asset.Signs.speedLimitZoneEU105
                case 110:
                    return Asset.Signs.speedLimitZoneEU110
                case 115:
                    return Asset.Signs.speedLimitZoneEU115
                case 120:
                    return Asset.Signs.speedLimitZoneEU120
                default: return nil
                }
            case .speedLimitEndZone:
                switch number {
                case 5:
                    return Asset.Signs.speedLimitEndZoneEU5
                case 10:
                    return Asset.Signs.speedLimitEndZoneEU10
                case 15:
                    return Asset.Signs.speedLimitEndZoneEU15
                case 20:
                    return Asset.Signs.speedLimitEndZoneEU20
                case 25:
                    return Asset.Signs.speedLimitEndZoneEU25
                case 30:
                    return Asset.Signs.speedLimitEndZoneEU30
                case 35:
                    return Asset.Signs.speedLimitEndZoneEU35
                case 40:
                    return Asset.Signs.speedLimitEndZoneEU40
                case 45:
                    return Asset.Signs.speedLimitEndZoneEU45
                case 50:
                    return Asset.Signs.speedLimitEndZoneEU50
                case 55:
                    return Asset.Signs.speedLimitEndZoneEU55
                case 60:
                    return Asset.Signs.speedLimitEndZoneEU60
                case 65:
                    return Asset.Signs.speedLimitEndZoneEU65
                case 70:
                    return Asset.Signs.speedLimitEndZoneEU70
                case 75:
                    return Asset.Signs.speedLimitEndZoneEU75
                case 80:
                    return Asset.Signs.speedLimitEndZoneEU80
                case 85:
                    return Asset.Signs.speedLimitEndZoneEU85
                case 90:
                    return Asset.Signs.speedLimitEndZoneEU90
                case 95:
                    return Asset.Signs.speedLimitEndZoneEU95
                case 100:
                    return Asset.Signs.speedLimitEndZoneEU100
                case 105:
                    return Asset.Signs.speedLimitEndZoneEU105
                case 110:
                    return Asset.Signs.speedLimitEndZoneEU110
                case 115:
                    return Asset.Signs.speedLimitEndZoneEU115
                case 120:
                    return Asset.Signs.speedLimitEndZoneEU120
                default: return nil
                }
            }
        case .unknown:
            return nil
        }
    }
}
