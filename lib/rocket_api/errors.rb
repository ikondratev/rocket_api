module RocketApi
  # Base error
  class Error < StandardError; end

  # Raise in case of dir creation error
  class CreateDirError < Error; end

  # Raise in case of file creation error
  class InitFilesError < Error; end

  # Raise in case of validation error
  class ValidationError < Error; end

  # Raise in case of commands validation error
  class InitCommandsError < Error; end

  # Railse in case of not valid user commands
  class ApplyCommandsError < Error; end
end
