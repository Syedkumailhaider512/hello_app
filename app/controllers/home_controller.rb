class HomeController < ApplicationController
  def index
    @name = params[:name]&.strip
    @domain = params[:domain]

    research_topics = {
      "AI Learning" => "Design a biologically inspired learning system that adapts from experience using reinforcement and curiosity.",
      "Space Biology" => "Explore how life could survive in extreme underground planetary environments with shifting resources.",
      "Artificial Evolution" => "Simulate how digital organisms evolve structure and behavior under environmental pressure.",
      "Consciousness" => "Investigate how attention, memory, and sensory integration could support awareness in artificial agents.",
      "Cosmic Simulation" => "Model how different universe parameters influence large-scale structure, instability, and habitability."
    }

    @time = Time.now.strftime("%I:%M %p")

    if @name.present?
      @message = "Hello, #{@name}!"
      if @domain.present? && research_topics[@domain]
        @selected_title = @domain
        @selected_idea = research_topics[@domain]
      else
        @selected_title, @selected_idea = research_topics.to_a.sample
      end
    elsif params.key?(:name)
      @error = "Please enter your name."
    end
  end

  def about
  end
end