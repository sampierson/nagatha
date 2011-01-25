task :ci do
  Rake::Task['spec'].invoke
  Rake::Task['cucumber'].invoke
  Rake::Task['jasmine:ci'].invoke
end

