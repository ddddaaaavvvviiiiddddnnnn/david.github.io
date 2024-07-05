// logical_operator.js

/**
 * Checks eligibility to work based on age and experience.
 * @param {number} age - The age of the person.
 * @param {boolean} experience - Whether the person has relevant work experience.
 * @returns {boolean} Returns true if eligible to work, false otherwise.
 */
function checkEligibility(age, experience) {
    // Eligibility criteria: age must be 21 or above and must have experience
    if (age >= 21 && experience) {
        return eligible;
    } else {
        return not_eligible;
    }
}
