class SurgeryData:
    def __init__(self, surgery, doctor, hostpital, cases, median_percentile, ninety_percentile, is_adult):
        self.surgery = surgery
        self.doctor = doctor
        self.hostpital = hostpital
        self.cases = cases
        self.median_percentile = median_percentile
        self.ninety_percentile = ninety_percentile
        self.is_adult = is_adult