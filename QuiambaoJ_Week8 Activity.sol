// SPDX-License-Identifier: HAU
pragma solidity ^0.8.0;

contract TimeDeposit {
    string public submittedBy = "JUNE SARAH QUIAMBAO";

    uint principal = 250000;

    // Define instrument types
    enum InstrumentType { TimeDeposit, GovernmentTreasuryBond, VolatileBond }

    function computeTimeDeposit(
        uint rate,
        uint yearsPeriod,
        InstrumentType instrument
    )
        public
        view
        returns (
            uint Principal,
            InstrumentType Instrument,
            uint Years,
            uint InterestPerPeriod,
            uint TotalInterest,
            uint FinalAmount
        )
    {
        uint periodsPerYear = 1; // default annual compounding
        InterestPerPeriod = (principal * rate) / 100;

        if (instrument == InstrumentType.GovernmentTreasuryBond) {
            // Semi-annual compounding
            periodsPerYear = 2;
            InterestPerPeriod = (principal * rate) / 100 / periodsPerYear;
        } else if (instrument == InstrumentType.VolatileBond) {
            // Example: quarterly compounding (4 times per year)
            periodsPerYear = 4;
            InterestPerPeriod = (principal * rate) / 100 / periodsPerYear;
        }

        uint totalPeriods = yearsPeriod * periodsPerYear;

        for (uint i = 0; i < totalPeriods; i++) {
            TotalInterest += InterestPerPeriod;
        }

        FinalAmount = principal + TotalInterest;

        return (
            principal,
            instrument,
            yearsPeriod,
            InterestPerPeriod,
            TotalInterest,
            FinalAmount
        );
    }
}
